class IterationsController < ApplicationController
  require 'spreadsheet'
  
  before_filter :authenticate_user!
  load_and_authorize_resource
  #load_and_authorize_resource :through => :topic_group
  
  respond_to :html, :xml, :json, :js
  

  # GET /iterations/1
  # GET /iterations/1.xml
  def show
    #@iteration = Iteration.find(params[:id])
    @topic_group = TopicGroup.find(@iteration.topic_group_id)
    @iterations = @topic_group.iterations.sort_by{ |iteration| iteration.num }
    @topic = Topic.find(@topic_group.topic_id)
    #@elements = @iteration.elements
    @elements = @iteration.current_elements
    @suggested_elements = current_user.suggested_elements(@iteration.id)
    @participating_users = @topic_group.participating_users
    @submitted = current_user.submitted_list?(@iteration.id)
    #@manager = current_user.manager?(@topic_group.id)
    #flash[:notice] = @suggested_elements.size
    
    if (can? :manage, @topic_group) && @topic_group.active
      @new_elements = @topic_group.iterations.last.new_elements
    end
    
    # JDavis: if the iteration is active, check to see it the user has submitted.
    #@active = @iteration.active ? !current_user.submitted_list?(@iteration.id) : false
    
    #flash[:notice] = '@iteration.active = ' + @iteration.active.to_s + ', submitted_list = ' + current_user.submitted_list?(@iteration.id).to_s + ', @active = ' + @active.to_s
    respond_with(@iteration)
  end


  # GET /iterations/1/edit
  #def edit
  #  @iteration = Iteration.find(params[:id])
  #end


  # PUT /iterations/1
  # PUT /iterations/1.xml
  def update
    #@iteration = Iteration.find(params[:id])
    @topic_group = TopicGroup.find(params[:topic_group_id])

    flash[:notice] = 'Iteration was successfully updated.' if @iteration.update_attributes(params[:iteration])
    respond_with(@iteration) do |format|
      format.html { redirect_to topic_group_iteration_url(@topic_group, @iteration) }
    end
    
    
  end

  # DELETE /iterations/1
  # DELETE /iterations/1.xml
  def destroy
    #@iteration = Iteration.find(params[:id])
    @iteration.destroy

    respond_with(@iteration)
  end
  
  # JDavis: this method closes the current iteration.
  def close
    #@iteration = Iteration.find(params[:id])
    @topic_group = TopicGroup.find(params[:topic_group_id])
    
    flash[:notice] = 'Iteration was successfully closed.' if @iteration.close
    respond_with(@iteration) do |format|
      format.html { redirect_to topic_group_iteration_url(@topic_group, @iteration)+'#tabs-4' }
    end
  end
  
  # JDavis: this method starts an iteration by either reopening the last iteration or creating a new iteration.
  def start
    topic_group = TopicGroup.find(params[:topic_group_id])
    last_iteration = topic_group.iterations.last
    
    new_iteration = last_iteration.user_lists.size > 0 ? last_iteration.start_new_iteration : last_iteration.reopen
    topic_group.notify_users_new_iteration
    
    flash[:notice] = 'Iteration was successfully started.' if new_iteration
    
    respond_to do |format|
      format.html { redirect_to topic_group_iteration_url(topic_group, new_iteration)+'#tabs-4' }
    end
  end
 
  
  private
  
  #def sort_column
  #  Element.column_names.include?(params[:sort]) ? params[:sort] : "name"
  #end
  
  #def sort_direction
  #  %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  #end
  
end
