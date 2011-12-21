class MeController < ApplicationController
  #before_filter :authenticate_user!
  
  def home
    if user_signed_in?
      @my_topic_groups = current_user.my_topic_groups
      @closed_topic_groups = current_user.closed_topic_groups
      @managed_topic_groups = current_user.managed_topic_groups
    else
      redirect_to authentications_url
    end
  end

  def profile
  end

  

end
