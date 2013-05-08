class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    #else
    #  redirect_to login_path
    end
  end

  def user_signed_in?
    current_user.present?
  end

  helper_method :user_signed_in?
  
end
