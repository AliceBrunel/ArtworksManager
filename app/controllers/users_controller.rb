class UsersController < ApplicationController

  def index
  end 

  def new
   @user = User.new
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
	  :job
      )
   end

 end
