class SessionsController < ApplicationController
skip_before_action :verify_user_is_authenticated, only: [:new, :create]

  def new
	@user = User.new
  end

  def create
	@user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
		flash[:error] = "Not working"
      redirect_to 'new'
    end
  end

  def destroy
    reset_session
	@current_user = nil
    redirect_to root_path
  end

end
