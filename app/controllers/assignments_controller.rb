class AssignmentsController < ApplicationController
  
  autocomplete :user, :last_name, :extra_data => [:id, :first_name], :display_value => :name
  
  # GET /assignments
  # GET /assignments.xml
  def index
    @assignments = Assignment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @assignments }
    end
  end

  # GET /assignments/1
  # GET /assignments/1.xml
  def show
    @assignment = Assignment.find(params[:id])

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
    @assignment = Assignment.find(params[:id])
  end

  # POST /assignments
  # POST /assignments.xml
  def create
    @topic = Topic.find(params[:topic_id])
    @assignment = Assignment.new(params[:assignment])
    #@assignment.user_id = 4 #JDavis: very temporary for testing
    new_notice = (params[:assignment])
    respond_to do |format|
      if @assignment.save
        #format.html { redirect_to edit_topic_path(@topic)+"#tabs-3", :notice => 'Assignment was successfully created.' }
        format.html { redirect_to edit_topic_path(@topic)+"#tabs-3", :notice => new_notice }
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
    @assignment = Assignment.find(params[:id])

    respond_to do |format|
      if @assignment.update_attributes(params[:assignment])
        format.html { redirect_to edit_topic_path(@topic)+"#tabs-3", :notice => 'Assignment was successfully updated.' }
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
    @assignment = Assignment.find(params[:id])
    @assignment.destroy

    respond_to do |format|
      format.html { redirect_to(assignments_url) }
      format.xml  { head :ok }
    end
  end
  
  def assign_topic
    
  end
end
