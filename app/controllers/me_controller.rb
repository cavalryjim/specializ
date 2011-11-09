class MeController < ApplicationController
  before_filter :authenticate_user!
  
  def home
    
    @my_topic_groups = current_user.my_topic_groups
    @managed_topic_groups = current_user.managed_topic_groups
    
  end

  def profile
  end

  

end
