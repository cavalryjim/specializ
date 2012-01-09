class TopicsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
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
    @seed_id = Grouping.where(:company_id => current_user.company_id).first.id
    
    respond_with(@topic)
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
    @topics = Topic.where(:company_id => current_user.company_id)
    #@current_user = current_user
    @assignments = Assignment.where(:topic_group_id => TopicGroup.where(:topic_id => @topic.id))
    @selected_groups = TopicGroup.where(:topic_id => @topic.id).map(&:grouping_id)
    @seed_id = Grouping.where(:company_id => current_user.company_id).first.id
    
    respond_with(@topic)
  end

  # POST /topics
  # POST /topics.xml
  def create
    @topic = Topic.new(params[:topic])
    @topic.company_id = current_user.company_id
    
    if params.has_key?(:groupings) && @topic.save 
      @topic.update_groupings(params[:groupings])
      flash[:notice] = 'Topic was successfully created.' 
    else
      @topic.errors[:base] << "You must select one or more participating groups." unless params.has_key?(:groupings)
      @topics = Topic.where(:company_id => current_user.company_id)
      @assignments = []
      @selected_groups = []
      @seed_id = Grouping.where(:company_id => current_user.company_id).first.id
    end
    
    respond_with(@topic)
  end

  # PUT /topics/1
  # PUT /topics/1.xml
  def update
    @topic = Topic.find(params[:id])
    #groupings = []
    if params.has_key?(:groupings) && @topic.update_attributes(params[:topic])  
      @topic.update_groupings(params[:groupings])
      flash[:notice] = 'Topic was successfully updated.'
    else
      @topic.errors[:base] << "You must select one or more participating groups." unless params.has_key?(:groupings)
      @topics = Topic.where(:company_id => current_user.company_id)
      @assignments = []
      @selected_groups = []
      @seed_id = Grouping.where(:company_id => current_user.company_id).first.id
    end  
    
    respond_with(@topic)
    #respond_with(@topic) do |format|
    #  format.html { redirect_to edit_topic_path(@topic) }
    #end
    
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
  
  #JDavis: Randomly select between 0 - 100% of the users in a group and staff to a topic_group.
  def staff_topic
    @topic = Topic.find(params[:topic_id])
    @topic_groups = @topic.topic_groups
    new_notice = 'Topic successfully staffed!'
    percentage = (params[:percentage]).to_f/100
    users = []
    
    @topic_groups.each do |topic_group|
      group = Grouping.find(topic_group.grouping_id)
      users = group.user_list(percentage)
      topic_group.staff(users) if users.size > 0
    end
    
    redirect_to edit_topic_path(@topic)+"#tabs-3", {:notice => new_notice}
  end
  
end
