class TopicGroupsController < ApplicationController
  
  # GET /topic_groups
  # GET /topic_groups.xml
  def index
    @topic_groups = TopicGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @topic_groups }
    end
  end

  # GET /topic_groups/1
  # GET /topic_groups/1.xml
  def show
    @topic_group = TopicGroup.find(params[:id])
    @iterations = @topic_group.iterations
    @elements = @iterations.last.elements
    #@elements = Element.all
    
    #render 'iterations'

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
  end

  # POST /topic_groups
  # POST /topic_groups.xml
  def create
    @topic_group = TopicGroup.new(params[:topic_group]) 
    @topic_group.name = Topic.find(@topic_group.topic_id).name + ": " + Grouping.find(@topic_group.grouping_id).fullname
    respond_to do |format|
      if @topic_group.save
        @iteration = Iteration.new
        @iteration.topic_group_id = @topic_group.id
        @iteration.num = 1
        @iteration.active = true
        @iteration.save
        format.html { redirect_to(@topic_group, :notice => 'Topic group was successfully created.') }
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

    respond_to do |format|
      if @topic_group.update_attributes(params[:topic_group])
        format.html { redirect_to(@topic_group, :notice => 'Topic group was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @topic_group.errors, :status => :unprocessable_entity }
      end
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
  
  def assign_topic
    
      #validates :name, :presence => true
      #validates :goal, :presence => true
      #validates :active, :inclusion => {:in => [true, false]}
      #validates :topic_id, :presence => true
      #validates :grouping_id, :presence => true
   
    
    params[:grouping].each do |name|
      
    end
    
    #respond_to do |format|
    #  if true
    #    format.html { redirect_to topic_group_iteration_url(@topic_group, @iteration), :notice => 'Your list was successfully submitted.' }
        #format.xml  { render :xml => @iteration, :status => :created, :location => @iteration }
    #  else
        #format.html { render :action => "new" }
        #format.xml  { render :xml => @iteration.errors, :status => :unprocessable_entity }
    #  end
    #end
    
    redirect_to manager_path
  end
  
end
