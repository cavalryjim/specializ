class MeController < ApplicationController
  #before_filter :authenticate_user!
  #respond_to  :html
  
  def home
    @title = "Home"
    if user_signed_in?
      @open_topic_groups = current_user.open_topic_groups
      @closed_topic_groups = current_user.closed_topic_groups
      @managed_topic_groups = current_user.managed_topic_groups
    else
      gflash :notice => "Please sign in to participate."
      redirect_to authentications_url
    end
  end
  
  def events
    @date = params[:date]
    
    respond_to do |format|
      format.html {render :partial => "events"}
    end
  end

end
