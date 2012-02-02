class MeController < ApplicationController
  #before_filter :authenticate_user!
  #respond_to  :html
  
  def home
    @title = "Home"
    if user_signed_in?
      @open_topic_groups = current_user.open_topic_groups
      @closed_topic_groups = current_user.closed_topic_groups
      @managed_topic_groups = current_user.managed_topic_groups
      #@date = Date.today
      #@events = current_user.events(@date)
    else
      gflash :notice => "Please sign in to participate."
      redirect_to authentications_url
    end
  end
  
  def events
    #@date = Date.parse(params[:date])
    start = Time.at(params[:start].to_i).to_date
    stop = Time.at(params[:stop].to_i).to_date
    @events = current_user.events(start, stop) 
    
    
    if can?(:read, @events)
      respond_to do |format|
        #format.html {render :partial => "events"}
        format.json {render 'events'}
      end
    end
  end

end
