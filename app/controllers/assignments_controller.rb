class AssignmentsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  autocomplete :user, :last_name, :extra_data => [:id, :first_name, :email], :display_value => :name_email
  
  respond_to :html, :json
  
  # GET /assignments
  # GET /assignments.xml
  def index
    #@assignments = Assignment.all

    
  end

  # GET /assignments/1
  # GET /assignments/1.xml
  def show
    #@assignment = Assignment.find(params[:id])

    
  end

  # GET /assignments/new
  # GET /assignments/new.xml
  def new
    @topic = Topic.find(params[:topic_id])
    @topic_groups = @topic.topic_groups
    @assignment = Assignment.new

  end

  # GET /assignments/1/edit
  def edit
    @topic = Topic.find(params[:topic_id])
    @topic_groups = @topic.topic_groups
    #@assignment = Assignment.find(params[:id])
  end

  # POST /assignments
  # POST /assignments.xml
  def create
    @topic = Topic.find(params[:topic_id])
    @assignment = Assignment.find_or_initialize_by_topic_group_id_and_user_id(params[:assignment])
    #@assignment = Assignment.new(params[:assignment])
    
    if @assignment.save
      topic_group = TopicGroup.find(@assignment.topic_group_id) 
      user = User.find(@assignment.user_id) 
      user.notify_assignment(topic_group)
      gflash :success => "User assigned."
      redirect_to edit_topic_path(@topic)
    else
      @topic_groups = @topic.topic_groups
      respond_with(@assignment)
    end
  end

  # PUT /assignments/1
  # PUT /assignments/1.xml
  def update
    @topic = Topic.find(params[:topic_id])
    #@assignment = Assignment.find(params[:id])

    respond_to do |format|
      if @assignment.update_attributes(params[:assignment])
        gflash :success => "Assignement updated."
        format.html { redirect_to edit_topic_path(@topic) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @assignment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.xml
  def destroy
    @topic = Topic.find(params[:topic_id]) if params.has_key?(:topic_id)
    @topic_group = TopicGroup.find(params[:topic_group_id]) if params.has_key?(:topic_group_id)
    #@assignment = Assignment.find(params[:id])
    gflash :success => "User removed." if @assignment.destroy
    
    if @topic_group
      redirect_to topic_group_iteration_path(@topic_group, @topic_group.iterations.last)
    else
      redirect_to edit_topic_path(@topic) 
    end
    
  end
  
  def get_autocomplete_items(parameters)
    users = super(parameters)
    users = users.where(:company_id => current_user.company_id)
  end

end
