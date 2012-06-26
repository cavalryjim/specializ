class TopicsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  respond_to :html, :js, :json
  
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
    @topic.company_id = current_user.company_id
    @assignments = []
    @libraries = current_user.libraries.order('lft ASC')
    #@selected_groups = []
    @title = 'Manager'
    
    respond_with(@topic)
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
    @topics = Topic.where(:company_id => current_user.company_id)
    #@assignments = Assignment.where(:topic_group_id => TopicGroup.where(:topic_id => @topic.id))
    @assignments = Assignment.where(:topic_group_id => @topic.topic_group_ids)
    #@selected_groups = TopicGroup.where(:topic_id => @topic.id).map(&:grouping_id)
    @libraries = current_user.libraries.order('lft ASC')
    @title = @topic
    
    respond_with(@topic)
  end

  # POST /topics
  # POST /topics.xml
  def create
    @topic = Topic.new(params[:topic])
    @topic.company_id = current_user.company_id
    
    if @topic.save && params[:topic][:grouping_ids]   
      @topic.update_groupings(params[:topic][:grouping_ids])
      @topic.update_libraries(params[:topic][:library_ids]) if params[:topic][:library_ids]
      gflash :success => 'Topic created.' 
    else
      @topic.errors[:base] << "You must select one or more participating groups." unless params[:topic][:grouping_ids]
      @topics = Topic.where(:company_id => current_user.company_id)
      @assignments = []
      #@selected_groups = []
    end
    
    if @topic.errors.any?
      @topic.errors.full_messages.each do |msg|
        gflash :error => { :value => msg.to_s, :sticky => true}
      end
    end
    
    respond_with(@topic)
  end

  # PUT /topics/1
  # PUT /topics/1.xml
  def update
    @topic = Topic.find(params[:id])
    #groupings = []
    if params[:topic][:status] == 1.to_s && @topic.status == 1
      if params[:topic][:grouping_ids] && @topic.update_attributes(params[:topic])  
        @topic.update_groupings(params[:topic][:grouping_ids])
        @topic.update_libraries(params[:topic][:library_ids]) if params[:topic][:library_ids]
        gflash :success => 'Topic updated.'
      else
        @topic.errors[:base] << "You must select one or more participating groups." unless params[:topic][:grouping_ids]
        @topics = Topic.where(:company_id => current_user.company_id)
        @assignments = Assignment.where(:topic_group_id => TopicGroup.where(:topic_id => @topic.id))
        #@selected_groups = TopicGroup.where(:topic_id => @topic.id).map(&:grouping_id)
      end  
    else 
      gflash :success => 'Topic updated.' if @topic.update_attributes(params[:topic])
    end
    
    if @topic.errors.any?
      @topic.errors.full_messages.each do |msg|
        gflash :error => { :value => msg.to_s, :sticky => true}
      end
    end
    
    respond_with(@topic)
    
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
  def staff_topic(restaff = true)
    @topic = Topic.find(params[:topic_id])
    value = params[:percentage].to_f if params.has_key?(:percentage)
    
    if value > 0 && value <= 100
      @topic.remove_all_participants if restaff
      @topic.staff_topic(params[:percentage].to_f)
      gflash :success => 'Topic staffed'
    else
      gflash :error => 'Please enter a valid number between 0 and 100'
    end
     
    redirect_to edit_topic_path(@topic)
  end
  
  def assigned_participants(topic_group_id = Topic.find(params[:topic_id]).topic_groups.first.id)
    @topic = Topic.find(params[:topic_id])
    #@assignment = Assignment.find(params[:assignment_id])
    
    respond_to do |format|
      format.json { render json: AssignmentsDatatable.new(view_context, topic_group_id)  }
      #format.json { render json: @topic }
    end
  end
  
  def assign_libraries
    @topic = Topic.find(params[:topic_id])

    @topic.assign_libraries(params[:libraries].map{|k,v| k})
    gflash :success => "Topic items populated from selected libraries."
    
    redirect_to edit_topic_path(@topic)
  end
  
end
