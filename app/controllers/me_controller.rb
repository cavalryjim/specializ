class MeController < ApplicationController
  def home
    @current_user = User.first
    @topic_groups = @current_user.topic_groups
    
    
   
    
  end

  def profile
  end

  
  
  def current_user
    # JDavis: Hardcoding the current user as the first user during development.
    User.first
  end

end
