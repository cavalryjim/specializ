class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = 'You do not have access to that resource.'
    redirect_to root_url
  end
  
  
  
end
