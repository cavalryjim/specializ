class TopicGroupsController < ApplicationController
  before_filter :authenticate_user!
  
  respond_to :html
  
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
    if @iterations.empty?
      @elements = []
    else
      @elements = @iterations.last.elements 
    end
     

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

    flash[:notice] = 'Topic Group was successfully updated.' if @topic_group.update_attributes(params[:topic_group])
    respond_with(@topic_group) do |format|
      format.html { redirect_to edit_topic_path(@topic_group.topic_id)+'#tabs-4' }
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
        format.html { redirect_to topic_group_iteration_url(@topic_group, @topic_group.iterations.last), :notice => 'Topic group was successfully closed.' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @topic_group.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # JDavis: need to add topic_groups that do not exist and remove any that were 'unchecked' in _configure.html.erb
  # JDavis: this method is no longer used...moved the call to the topic_controller and logic to the model layer.
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
    @topic_groups = @topic.topic_groups
    new_notice = 'Topic successfully staffed!'
    percentage = (params[:percentage]).to_f/100
    #new_notice = percentage
  
    @topic_groups.each do |topic_group|
      group = Grouping.find(topic_group.grouping_id)
      users = group.users.order("RAND()").limit((group.users.count*percentage).ceil)
      topic_group.staff(users)
      
      #users.each do |user|
      #  assignment = Assignment.find_or_initialize_by_topic_group_id_and_user_id(topic_group.id, user.id)
      #  assignment.manager = assignment.manager || false
      #  assignment.participating = true
      #  if assignment.save
      #    user.notify_assignment(topic_group)
      #  else
      #    new_notice = 'There was a problem staffing this topic.'
      #  end
      #end
    end
    
    redirect_to edit_topic_path(@topic)+"#tabs-3", {:notice => new_notice}
  end
  
  # JDavis: this method imports elements from a spreadsheet
  def import_elements
    #@iteration = Iteration.find(params[:iteration_id])
    @topic_group = TopicGroup.find(params[:topic_group_id])
    @topic_group.import_elements(params[:file], current_user.id)
    
   
    
    respond_to do |format|
      format.html { redirect_to topic_group_iteration_url(@topic_group, @topic_group.iterations.last), :notice => 'List was successfully imported.' }
      format.xml  { head :ok }
    end
  end
  
end
