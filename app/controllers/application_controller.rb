class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
    gflash :error => 'You do not have access to that resource.'
    redirect_to root_url
  end
  
  
  
end
