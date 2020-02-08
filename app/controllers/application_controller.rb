class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	helper_method :current_user


	private

	def verify_user_is_authenticated
		redirect_to '/login' unless user_is_authenticated
	 end

	def user_is_authenticated
		!!current_user
	end

	def current_user
		if session[:user_id]
		  @current_user ||= User.find(session[:user_id])
		else
		  @current_user = nil
		end
  end

end
