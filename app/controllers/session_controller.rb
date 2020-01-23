class SessionController < ApplicationController
skip_before_action :verify_user_is_authenticated, only: [:new, :create]

  def new
    @group_options = Group.all.map{|group| group.name }
    @user = User.new
  end

  def create
    if @user = User.find_by_email(params[:email])
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end

end
