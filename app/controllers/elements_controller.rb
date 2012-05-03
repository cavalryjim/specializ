class ElementsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  #require 'will_paginate'
  respond_to :html,:json
  

  # GET /elements/1
  # GET /elements/1.xml
  def show
    #@element = Element.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @element }
    end
  end

  # GET /elements/new
  # GET /elements/new.xml
  def new
    @topic_group = TopicGroup.find_by_id(params[:topic_group_id])
    @iteration = Iteration.find_by_id(params[:iteration_id])
    #@element = Element.new
    
    #3.times { @element.element_attributes.build }
   
    #respond_with(@element, @topic_group, @iteration, @element)
    
  end

  # GET /elements/1/edit
  def edit
    @topic_group = TopicGroup.find_by_id(params[:topic_group_id])
    @iteration = Iteration.find_by_id(params[:iteration_id])
    #@element = Element.find(params[:id])
    @element_attribute_types = ElementAttributeType.all
  end

  # POST /elements
  # POST /elements.xml
  def create
    @topic_group = TopicGroup.find_by_id(params[:topic_group_id])
    @iteration = Iteration.find_by_id(params[:iteration_id])
    @element = Element.new(params[:element])
    @element.current = true 
    @element.created_by = current_user.id
    @element.topic_group_id = @topic_group.id
    
    if @element.unique_to_iteration?(@iteration.id)   
      if @element.save && @element.add_to_iteration(@iteration.id, true, true)
        UserList.find_or_create_by_element_id_and_user_id_and_iteration_id(@element.id, current_user.id, @iteration.id, :score => 0)
        gflash :success => "Element created."
        redirect_to topic_group_iteration_url(@topic_group, @iteration) 
      else
        @element.destroy #JDavis: I do not want a rogue element not assigned to an iteration.
        gflash :error => "There was a problem adding that item."
        redirect_to topic_group_iteration_url(@topic_group, @iteration) 
      end
    else
      element_id = @iteration.elements.where(:name => @element.name).first.id
      UserList.find_or_create_by_element_id_and_user_id_and_iteration_id(element_id, current_user.id, @iteration.id, :score => 0)
      gflash :success => "Element created."
      redirect_to topic_group_iteration_url(@topic_group, @iteration) 
    end
 
  end

  # PUT /elements/1
  # PUT /elements/1.xml
  def update
    @topic_group = TopicGroup.find_by_id(params[:topic_group_id])
    @iteration = Iteration.find_by_id(params[:iteration_id]) 
    params[:element][:edited_by] = current_user.id #JDavis: identifying the last user to edit this element
    if @element.update_attributes(params[:element])
      gflash :success => "Item updated."
      redirect_to topic_group_iteration_url(@topic_group, @iteration)
    else 
      respond_with(@element)  
    end

  end

  # DELETE /elements/1
  # DELETE /elements/1.xml
  def destroy
    @iteration = Iteration.find(params[:iteration_id])
    @topic_group = TopicGroup.find(@iteration.topic_group_id)
    gflash :success => "Item removed." if @element.destroy

    respond_to do |format|
      format.html { redirect_to topic_group_iteration_url(@topic_group, @iteration) }
      format.xml  { head :ok }
    end
  end
  
end
