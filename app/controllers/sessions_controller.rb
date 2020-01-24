class SessionsController < ApplicationController
skip_before_action :verify_user_is_authenticated, only: [:new, :create]

  def new
    @user = User.new
    @groups = Group.all
  end

  def create
    @groups = Group.all
    user = User.find_by(email: params[:user][:email])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless user
    session[:user_id] = user.id
    @user = user
    redirect_to user_path(@user)
    end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end

end
