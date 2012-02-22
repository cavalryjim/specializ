class AssignmentsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  autocomplete :user, :last_name, :extra_data => [:id, :first_name, :email], :display_value => :name_email, :scope => [:belongs_company]
  
  # GET /assignments
  # GET /assignments.xml
  def index
    #@assignments = Assignment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @assignments }
    end
  end

  # GET /assignments/1
  # GET /assignments/1.xml
  def show
    #@assignment = Assignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @assignment }
    end
  end

  # GET /assignments/new
  # GET /assignments/new.xml
  def new
    @topic = Topic.find(params[:topic_id])
    @topic_groups = @topic.topic_groups
    @assignment = Assignment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @assignment }
    end
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
    topic_group = TopicGroup.find(@assignment.topic_group_id)
    user = User.find(@assignment.user_id)
    
    respond_to do |format|
      if @assignment.save
        user.notify_assignment(topic_group)
        gflash :success => "User assigned."
        format.html { redirect_to edit_topic_path(@topic) }
        format.xml  { render :xml => @assignment, :status => :created, :location => @assignment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @assignment.errors, :status => :unprocessable_entity }
      end
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
    @topic = Topic.find(params[:topic_id])
    #@assignment = Assignment.find(params[:id])
    gflash :success => "User removed." if @assignment.destroy

    respond_to do |format|
      format.html { redirect_to edit_topic_path(@topic) }
      format.xml  { head :ok }
    end
  end
  

end
