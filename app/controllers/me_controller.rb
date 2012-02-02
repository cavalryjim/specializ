class MeController < ApplicationController
  #before_filter :authenticate_user!
  #respond_to  :html
  
  def home
    @title = "Home"
    if user_signed_in?
      @open_topic_groups = current_user.open_topic_groups
      @closed_topic_groups = current_user.closed_topic_groups
      @managed_topic_groups = current_user.managed_topic_groups
      date = Date.today
      @event_list = current_user.events(date.beginning_of_month, date.end_of_month)
    else
      gflash :notice => "Please sign in to participate."
      redirect_to authentications_url
    end
  end
  
  def event_list
    @date = Date.parse(params[:date])
    @event_list = current_user.events(@date, @date)
    
    respond_to do |format|
      format.html {render :partial => "event_list"}  
    end
  end
  
  def events
    if params[:start]
      start = Time.at(params[:start].to_i).to_date
    else 
      start = Date.today.beginning_of_month
    end 
    
    if params[:stop]
      stop = Time.at(params[:stop].to_i).to_date 
    else
      stop = Date.today.end_of_month
    end
    @events = current_user.events(start, stop) 
     
    if can?(:read, @events)
      respond_to do |format|
        format.json {render 'events'}
      end
    end
  end

end
