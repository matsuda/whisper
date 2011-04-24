class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?

  private
  def current_user
    @current_user ||= session[:user]
  end

  def logged_in?
    return false unless current_user
    if current_user.nickname.nil?
      session[:user] = nil
      false
    else
      true
    end
  end

  def authentication_user!
    unless logged_in?
      redirect_to signin_path
    end
  end
end
