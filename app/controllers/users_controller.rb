class UsersController < ApplicationController
 skip_before_action :verify_user_is_authenticated, only: [:new,:create]


  def index
  end

  def new
   @user = User.new
  end

  def create
	@user = User.new(user_params)

    if @user.save
      flash[:notice] = "Account created successfully!"
      redirect_to user_path(@user.id)
    else
      flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
      render 'new'
    end
  end


  def show
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
