class IterationsController < ApplicationController
  require 'gchart'
  require 'spreadsheet'
  
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction
  
  respond_to :html, :xml, :json
  
  # GET /iterations
  # GET /iterations.xml
  def index
    @iterations = Iteration.all

    respond_with(@iterations)
  end

  # GET /iterations/1
  # GET /iterations/1.xml
  def show
    @iteration = Iteration.find(params[:id])
    @topic_group = TopicGroup.find(@iteration.topic_group_id)
    @iterations = @topic_group.iterations.sort_by{ |iteration| iteration.num }
    @topic = Topic.find(@topic_group.topic_id)
    #@elements = @iteration.elements.order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page]) 
    @elements = @iteration.elements
    # JDavis: if the iteration is active, check to see it the user has submitted.
    @active = @iteration.active ? current_user.submitted_list?(@iteration.id) : false
    @manager = current_user.manager?(@topic_group.id)
    @participating_users = @topic_group.participating_users
    consensus_data = @iterations.map { |i| i.consensus }
    x_axis = @iterations.map { |a| a.num.to_s }
    y_axis = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    @bar_chart = Gchart.bar(:title => "Consensus Levels",
                            :title_alignment => :left,
                            :title_size => 15,
                            :data => consensus_data, 
                            :bg => 'efefef',
                            :bar_colors => ['FF0000', '00FF00'],
                            :bar_width_and_spacing => '25,6',
                            :axis_with_labels => ['x', 'y'],
                            :axis_labels => [x_axis, y_axis],
                            :legend => ["Consensus not reached", "Consensus goal reached"],
                            :width => 500,
                            :height => 240, 
                            :max_value => 100)

    respond_with(@iteration)
  end

  # GET /iterations/new
  # GET /iterations/new.xml
  def new
    @iteration = Iteration.new

    respond_with(@iteration)
  end

  # GET /iterations/1/edit
  def edit
    @iteration = Iteration.find(params[:id])
  end

  # POST /iterations
  # POST /iterations.xml
  def create
    @iteration = Iteration.new(params[:iteration])

    respond_to do |format|
      if @iteration.save
        format.html { redirect_to(@iteration, :notice => 'Iteration was successfully created.') }
        format.xml  { render :xml => @iteration, :status => :created, :location => @iteration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @iteration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /iterations/1
  # PUT /iterations/1.xml
  def update
    @iteration = Iteration.find(params[:id])
    @topic_group = TopicGroup.find(params[:topic_group_id])

    respond_to do |format|
      if @iteration.update_attributes(params[:iteration])
        format.html { redirect_to topic_group_iteration_url(@topic_group, @iteration), :notice => 'Iteration was successfully updated.' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @iteration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /iterations/1
  # DELETE /iterations/1.xml
  def destroy
    @iteration = Iteration.find(params[:id])
    @iteration.destroy

    respond_with(@iteration)
  end
  
  # JDavis: this method closes the current iteration.
  def close
    @iteration = Iteration.find(params[:id])
    @topic_group = TopicGroup.find(params[:topic_group_id])
    
    respond_to do |format|
      if @iteration.close
        format.html { redirect_to topic_group_iteration_url(@topic_group, @iteration)+'#tabs-4', :notice => 'Iteration was successfully closed.' }
        format.xml  { head :ok }
      else
        format.html { render :action => "show" }
        format.xml  { render :xml => @iteration.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # JDavis: this method starts a new iteration.
  def start
    old_iteration = Iteration.find(params[:id])
    @topic_group = TopicGroup.find(params[:topic_group_id])
    @iteration = Iteration.find(old_iteration.start_new_iteration)
    #@iteration = Iteration.new
    #@iteration.num = old_iteration.num + 1
    #@iteration.active = true
    #@iteration.topic_group_id = @topic_group.id
    
    respond_to do |format|
      format.html { redirect_to topic_group_iteration_url(@topic_group, @iteration)+'#tabs-4', :notice => 'New iteration was successfully started.' }
      format.xml  { head :ok }
    end
  end
 
  
  private
  
  def sort_column
    Element.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end
