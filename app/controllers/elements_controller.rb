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
    
    3.times { @element.element_attributes.build }
   
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
    #JDavis todo: New elements should only be current if the manager approves them
    @element.current = true 
    @element.created_by = current_user.id

    respond_to do |format|
      if @element.save  
        if @element.add_to_iteration(@iteration.id, true, true)
          gflash :success => "Element created."
          format.html { redirect_to topic_group_iteration_url(@topic_group, @iteration) }
          format.xml  { render :xml => @element, :status => :created, :location => @element }
        else
          @element.destroy #JDavis: I do not want a rogue element not assigned to an iteration.
        end
      else
        gflash :error => "There was a problem adding that element."
        format.html { redirect_to topic_group_iteration_url(@topic_group, @iteration) }
        format.xml  { render :xml => @element.errors, :status => :unprocessable_entity }
      end
 
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
