class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end
  
  def current_user
    # JDavis: Hardcoding the current user as the first user during development.
    User.first
  end
end
