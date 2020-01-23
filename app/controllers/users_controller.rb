class UsersController < ApplicationController
 skip_before_action :verify_user_is_authenticated, only: [:new,:create]


  def index
  end 

  def new
   @user = User.new
   user.groups.build
  end 

  def create 
   if (user = User.create user_params)
    redirect_to user_path(user)
   else
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
	  :address,
	  :phone,
	  :position,
	  :job,
	  :group
      )
   end

 end
