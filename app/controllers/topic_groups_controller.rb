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
  
  # JDavis: need to add topic_groups that do not exist and remove any that were 'unchecked' in _configure.html.erb
  def assign_topic
    @topic = Topic.find(params[:topic_id])
    new_notice = 'Topic successfully configured!'
    
    params[:grouping].each do |key|
      tg = TopicGroup.find_by_topic_id_and_grouping_id(params[:topic_id], key) || TopicGroup.new(:topic_id => params[:topic_id], :grouping_id => key)
      tg.name = @topic.name + ": " + Grouping.find(key).fullname
      tg.goal = 90 #JDavis: hardcoding for testing.  JDtest.
      tg.active = true  
      if !tg.save
        new_notice = "There was a problem configuring this topic."
      end
    end
    
    groups_to_remove = TopicGroup.where(:topic_id => @topic.id).map(&:grouping_id) - params[:grouping].map(&:to_i)
    
    groups_to_remove.each do |g|
      tg = TopicGroup.find_by_topic_id_and_grouping_id(params[:topic_id], g)
      if !tg.delete
        new_notice = "There was a problem configuring this topic."
      end
    #  new_notice = new_notice + " | " + tg.name
    end
    
    redirect_to edit_topic_path(@topic)+"#tabs-2", {:notice => new_notice}
  end
  
  #JDavis: Randomly select between 0 - 100% of the users in a group and staff to a topic_group.
  def staff_topic
    @topic = Topic.find(params[:topic_id])
    @topic_groups = TopicGroup.where(:topic_id => @topic.id)
    new_notice = 'Topic successfully staffed!'
    percentage = params[:percentage].to_i
  
    @topic_groups.each do |topic_group|
     
      group = Grouping.find(topic_group.grouping_id)
      users = group.users.random(group.users.count*(percentage/100).ceil)
      
      users.each do |user|
        a = Assignment.find_by_topic_group_id_and_user_id(topic_group.id, user.id) || Assignment.new(:topic_group_id => topic_group.id, :user_id => user.id)
        a.manager = true
        a.participating = true
        if !a.save
          new_notice = 'There was a problem staffing this topic.'
        end
      end
    end
    
    redirect_to edit_topic_path(@topic)+"#tabs-3", {:notice => new_notice}
  end
  
end
