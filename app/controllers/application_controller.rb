require 'ostruct'

class ApplicationController < ActionController::Base
  helper_method :current_user

  # Only allow modern browsers supporting  images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user

  private

  # Minimal stub to test roles
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    redirect_to login_path, alert: "Please login" unless current_user
  end
end
