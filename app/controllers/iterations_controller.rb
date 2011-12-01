class IterationsController < ApplicationController
  #require 'gchart'
  require 'spreadsheet'
  
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction
  
  respond_to :html, :xml, :json
  
  # GET /iterations
  # GET /iterations.xml
  def index
    @iterations = Iteration.all

    respond_with(@iterations)
  end

  # GET /iterations/1
  # GET /iterations/1.xml
  def show
    @iteration = Iteration.find(params[:id])
    @topic_group = TopicGroup.find(@iteration.topic_group_id)
    @iterations = @topic_group.iterations.sort_by{ |iteration| iteration.num }
    @topic = Topic.find(@topic_group.topic_id)
    #@elements = @iteration.elements.order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page]) 
    @elements = @iteration.elements
    
    # JDavis: if the iteration is active, check to see it the user has submitted.
    @active = @iteration.active ? current_user.submitted_list?(@iteration.id) : false
    @manager = current_user.manager?(@topic_group.id)
    @participating_users = @topic_group.participating_users

    respond_with(@iteration)
  end

  # GET /iterations/new
  # GET /iterations/new.xml
  def new
    @iteration = Iteration.new

    respond_with(@iteration)
  end

  # GET /iterations/1/edit
  def edit
    @iteration = Iteration.find(params[:id])
  end

  # POST /iterations
  # POST /iterations.xml
  def create
    @iteration = Iteration.new(params[:iteration])

    flash[:notice] = 'Iteration was successfully created.' if @iteration.save
    respond_with(@iteration)
  end

  # PUT /iterations/1
  # PUT /iterations/1.xml
  def update
    @iteration = Iteration.find(params[:id])
    @topic_group = TopicGroup.find(params[:topic_group_id])

    flash[:notice] = 'Iteration was successfully updated.' if @iteration.update_attributes(params[:iteration])
    respond_with(@iteration) do |format|
      format.html { redirect_to topic_group_iteration_url(@topic_group, @iteration) }
    end
    
    
  end

  # DELETE /iterations/1
  # DELETE /iterations/1.xml
  def destroy
    @iteration = Iteration.find(params[:id])
    @iteration.destroy

    respond_with(@iteration)
  end
  
  # JDavis: this method closes the current iteration.
  def close
    @iteration = Iteration.find(params[:id])
    @topic_group = TopicGroup.find(params[:topic_group_id])
    
    flash[:notice] = 'Iteration was successfully closed.' if @iteration.close
    respond_with(@iteration) do |format|
      format.html { redirect_to topic_group_iteration_url(@topic_group, @iteration)+'#tabs-4' }
    end
  end
  
  # JDavis: this method starts a new iteration.
  def start
    old_iteration = Iteration.find(params[:id])
    @topic_group = TopicGroup.find(params[:topic_group_id])
    @iteration = Iteration.find(old_iteration.start_new_iteration)
    
    flash[:notice] = 'Iteration was successfully started.' if @iteration
    
    respond_to do |format|
      format.html { redirect_to topic_group_iteration_url(@topic_group, @iteration)+'#tabs-4' }
    end
  end
 
  
  private
  
  def sort_column
    Element.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end
