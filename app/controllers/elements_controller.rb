class ElementsController < ApplicationController

  require 'will_paginate'
  respond_to :html,:json,:xml
  
  
  def index  
    #@elements= Element.all.paginate(:per_page => 5, :page => params[:page]) 
    #responds_with (@elements)
    
  end

  # GET /elements/1
  # GET /elements/1.xml
  def show
    @element = Element.find(params[:id])

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
    @element = Element.new

    #respond_with(@element, @topic_group, @iteration, @element)
    
  end

  # GET /elements/1/edit
  def edit
    @topic_group = TopicGroup.find_by_id(params[:topic_group_id])
    @iteration = Iteration.find_by_id(params[:iteration_id])
    @element = Element.find(params[:id])
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
        #@iteration_list_element = IterationList.new
        #@iteration_list_element.element_id = @element.id
        #@iteration_list_element.iteration_id = @iteration.id
        #if @iteration_list_element.save
        if @element.add_to_iteration(@iteration.id)
          format.html { redirect_to topic_group_iteration_url(@topic_group, @iteration), :notice => 'Element was successfully created.' }
          format.xml  { render :xml => @element, :status => :created, :location => @element }
        else
          @element.destroy #JDavis: I do not want a rogue element not assigned to an iteration.
        end
      else
        format.html { redirect_to topic_group_iteration_url(@topic_group, @iteration), :notice => 'Element was not successfully created.' }
        format.xml  { render :xml => @element.errors, :status => :unprocessable_entity }
      end
 
    end
  end

  # PUT /elements/1
  # PUT /elements/1.xml
  def update
    @element = Element.find(params[:id])
    #JDavis: identifying the last user to edit this element
    @element.edited_by = current_user.id

    respond_to do |format|
      if @element.update_attributes(params[:element])
        format.html { redirect_to(@element, :notice => 'Element was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /elements/1
  # DELETE /elements/1.xml
  def destroy
    @iteration = Iteration.find(params[:iteration_id])
    @topic_group = TopicGroup.find(@iteration.topic_group_id)
    @element = Element.find(params[:id])
    @element.destroy

    respond_to do |format|
      format.html { redirect_to topic_group_iteration_url(@topic_group, @iteration), :notice => 'Item was successfully removed.' }
      format.xml  { head :ok }
    end
  end
  
  def rate_elements
    @iteration = Iteration.find(params[:iteration_id])
    @topic_group = TopicGroup.find(@iteration.topic_group_id)
    #JDavis: need to fix the user lookup. JDtest.
    
    params[:rating].each do |key, score|
      user_element_rating = UserList.new
      user_element_rating.user_id = current_user.id
      user_element_rating.element_id = key
      user_element_rating.score = score
      user_element_rating.iteration_id = @iteration.id
      user_element_rating.save
    end
    
    respond_to do |format|
      if true
        format.html { redirect_to topic_group_iteration_url(@topic_group, @iteration), :notice => 'Your list was successfully submitted.' }
        #format.xml  { render :xml => @iteration, :status => :created, :location => @iteration }
      else
        #format.html { render :action => "new" }
        #format.xml  { render :xml => @iteration.errors, :status => :unprocessable_entity }
      end
    end
 end
  
end
