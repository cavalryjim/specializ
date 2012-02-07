class TopicGroupsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  respond_to :html
  
  # GET /topic_groups
  # GET /topic_groups.xml
  def index
    #@topic_groups = TopicGroup.all
    redirect_to me_path
    

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.xml  { render :xml => @topic_groups }
    #end
  end

  # GET /topic_groups/1
  # GET /topic_groups/1.xml
  def show
    @topic_group = TopicGroup.find(params[:id])
    @iterations = @topic_group.iterations
    @elements = [] ? @iterations.empty? : @iterations.last.elements

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @topic_group }
    end
  end

  # GET /topic_groups/new
  # GET /topic_groups/new.xml
  def new
    @topic_group = TopicGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @topic_group }
    end
  end

  # GET /topic_groups/1/edit
  def edit
    @topic_group = TopicGroup.find(params[:id])
    @title = @topic_group
  end

  # POST /topic_groups
  # POST /topic_groups.xml
  def create
    @topic_group = TopicGroup.new(params[:topic_group]) 
    @topic_group.name = Topic.find(@topic_group.topic_id).name + ": " + Grouping.find(@topic_group.grouping_id).fullname
    respond_to do |format|
      if @topic_group.save
        gflash :success => "Topic created."
        format.html { redirect_to(@topic_group) }
        format.xml  { render :xml => @topic_group, :status => :created, :location => @topic_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @topic_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /topic_groups/1
  # PUT /topic_groups/1.xml
  def update
    @topic_group = TopicGroup.find(params[:id])

    gflash :success => 'Topic Group updated.' if @topic_group.update_attributes(params[:topic_group])
    respond_with(@topic_group) do |format|
      format.html { redirect_to edit_topic_path(@topic_group.topic_id) }
    end
  end

  # DELETE /topic_groups/1
  # DELETE /topic_groups/1.xml
  def destroy
    @topic_group = TopicGroup.find(params[:id])
    @topic_group.destroy

    respond_to do |format|
      format.html { redirect_to(topic_groups_url) }
      format.xml  { head :ok }
    end
  end
  
  # POST /topic_groups/1/close
  def close
    @topic_group = TopicGroup.find(params[:topic_group_id])
    
    respond_to do |format|
      if @topic_group.close
        gflash :success => "Topic Group closed."
        format.html { redirect_to topic_group_iteration_url(@topic_group, @topic_group.iterations.last) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @topic_group.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # JDavis: this method imports elements from a spreadsheet
  def import_elements
    @topic_group = TopicGroup.find(params[:topic_group_id])
    @topic_group.import_elements(params[:file], current_user.id)
   
    gflash :success => "List imported."
    
    redirect_to topic_group_iteration_path(@topic_group, @topic_group.iterations.last)
  end
  
end
