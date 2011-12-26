class TopicsController < ApplicationController
  before_filter :authenticate_user!
  
  respond_to :html, :xml, :json
  
  # GET /topics
  # GET /topics.xml
  def index
    @topics = Topic.where(:company_id => current_user.company_id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @topics }
    end
  end

  # GET /topics/1
  # GET /topics/1.xml
  def show
    @topics = Topic.where(:company_id => current_user.company_id)
    @topic = Topic.find(params[:id])

    respond_with(@topic)
  end

  # GET /topics/new
  # GET /topics/new.xml
  def new
    @topics = Topic.where(:company_id => current_user.company_id)
    @topic = Topic.new
    @assignments = []
    @selected_groups = []
    
    respond_with(@topic)
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
    @topics = Topic.where(:company_id => current_user.company_id)
    @current_user = current_user
    @assignments = Assignment.where(:topic_group_id => TopicGroup.where(:topic_id => @topic.id))
    @selected_groups = TopicGroup.where(:topic_id => @topic.id).map(&:grouping_id)
    
    respond_with(@topic)
  end

  # POST /topics
  # POST /topics.xml
  def create
    @topic = Topic.new(params[:topic])
    @topic.company_id = current_user.company_id
    
    if @topic.save
      @topic.update_groupings(params[:groupings])
      flash[:notice] = 'Topic was successfully created.' 
    end
    
    respond_with(@topic)
  end

  # PUT /topics/1
  # PUT /topics/1.xml
  def update
    @topic = Topic.find(params[:id])
    #groupings = []
    if @topic.update_attributes(params[:topic])
      @topic.update_groupings(params[:groupings])
      flash[:notice] = 'Topic was successfully updated.'
    end  
    
    respond_with(@topic) do |format|
      format.html { redirect_to edit_topic_path(@topic) }
    end
    
  end

  # DELETE /topics/1
  # DELETE /topics/1.xml
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to(manager_path) }
      format.xml  { head :ok }
    end
  end
  
end
