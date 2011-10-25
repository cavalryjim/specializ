class TopicsController < ApplicationController
  # GET /topics
  # GET /topics.xml
  def index
    #@topics = Topic.all 
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

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.xml
  def new
    @topics = Topic.where(:company_id => current_user.company_id)
    @topic = Topic.new
    #@groupings =
    @assignments = []
    @selected_groups = []

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
    @topics = Topic.where(:company_id => current_user.company_id)
    @assignments = Assignment.where(:topic_group_id => TopicGroup.where(:topic_id => @topic.id))
    @selected_groups = TopicGroup.where(:topic_id => @topic.id).map(&:grouping_id)
  end

  # POST /topics
  # POST /topics.xml
  def create
    @topic = Topic.new(params[:topic])
    @topic.company_id = current_user.company_id 
    
    respond_to do |format|
      if @topic.save
        format.html { redirect_to edit_topic_path(@topic), {:notice => 'Topic was successfully created.'}}
        format.xml  { render :xml => @topic, :status => :created, :location => @topic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.xml
  def update
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to edit_topic_path(@topic), {:notice => 'Topic was successfully updated.'}}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @topic.errors, :status => :unprocessable_entity }
      end
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
