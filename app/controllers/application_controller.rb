require 'ostruct'

class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user

  private

  # Minimal stub to test roles
  def current_user
    # Change the role here for testing
    User.find(1)
  end
end
