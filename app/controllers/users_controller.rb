class UsersController < ApplicationController
 skip_before_action :verify_user_is_authenticated, only: [:new,:create]
 has_secure_password

  def new
   @user = User.new
  end

  def create
	@user = User.create(user_params)

    if @user.save
	  session[:user_id] = @user.id
      flash[:notice] = "Account created successfully!"
      redirect_to user_path(@user.id)
    else
      flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
      redirect_to new_user_url
    end
  end


  def show
   @user = User.find_by(id:params[:id])
  end

  def edit 
  @user = User.find_by(id:params[:id])
  end 

 private

   def user_params
     params.require(:user).permit(
	  :name,
	  :surname,
		:email,
		:password,
    :password_confirmation,
	  :address,
	  :phone,
	  :position,
	  :group
      )
   end

 end
