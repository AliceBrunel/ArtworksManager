class SessionsController < ApplicationController
skip_before_action :verify_user_is_authenticated, only: [:new, :create]


end
