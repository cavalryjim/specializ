class TopicGroupsController < ApplicationController
  # GET /topic_groups
  # GET /topic_groups.xml
  
  #def index
  #  @topic_groups = TopicGroup.all

  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.xml  { render :xml => @topic_groups }
  #  end
  #end
  
  require 'will_paginate'
  respond_to :html,:json
  
  protect_from_forgery :except => [:post_data]
  
  # Don't forget to edit routes if you're using RESTful routing
  # 
  #resources :topic_groups,:only => [:index] do
  #   collection do
  #     post "post_data"
  #   end
  # end

  def post_data
    message=""
    topic_group_params = { :id => params[:id],:name => params[:name] }
    case params[:oper]
    when 'add'
      if params["id"] == "_empty"
        topic_group = TopicGroup.create(topic_group_params)
        message << ('add ok') if topic_group.errors.empty?
      end
      
    when 'edit'
      topic_group = TopicGroup.find(params[:id])
      message << ('update ok') if topic_group.update_attributes(topic_group_params)
    when 'del'
      Topic_group.destroy_all(:id => params[:id].split(","))
      message <<  ('del ok')
    when 'sort'
      topic_groups = TopicGroup.all
      topic_groups.each do |topic_group|
        topic_group.position = params['ids'].index(topic_group.id.to_s) + 1 if params['ids'].index(topic_group.id.to_s) 
        topic_group.save
      end
      message << "sort ak"
    else
      message <<  ('unknown action')
    end
    
    unless (topic_group && topic_group.errors).blank?  
      topic_group.errors.entries.each do |error|
        message << "<strong>#{TopicGroup.human_attribute_name(error[0])}</strong> : #{error[1]}<br/>"
      end
      render :json =>[false,message]
    else
      render :json => [true,message] 
    end
  end
  
  
  def index
    index_columns ||= [:id,:name]
    current_page = params[:page] ? params[:page].to_i : 1
    rows_per_page = params[:rows] ? params[:rows].to_i : 10

    conditions={:page => current_page, :per_page => rows_per_page}
    conditions[:order] = params["sidx"] + " " + params["sord"] unless (params[:sidx].blank? || params[:sord].blank?)
    
    if params[:_search] == "true"
      conditions[:conditions]=filter_by_conditions(index_columns)
    end
    
    @topic_groups=TopicGroup.paginate(conditions)
    total_entries=@topic_groups.total_entries
    
    respond_with(@topic_groups) do |format|
      format.json { render :json => @topic_groups.to_jqgrid_json(index_columns, current_page, rows_per_page, total_entries)}  
    end
  end

  # GET /topic_groups/1
  # GET /topic_groups/1.xml
  def show
    @topic_group = TopicGroup.find(params[:id])

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
end
