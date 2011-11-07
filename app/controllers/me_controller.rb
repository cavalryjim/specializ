class MeController < ApplicationController
  before_filter :authenticate_user!
  
  def home
    
    @topic_groups = current_user.topic_groups
    @managed_topic_groups = current_user.managed_topic_groups
    
  end

  def profile
  end

  

end
