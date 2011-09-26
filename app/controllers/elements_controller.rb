class ElementsController < ApplicationController
  # GET /elements
  # GET /elements.xml
  #def index
  #  @elements = Element.all

  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.xml  { render :xml => @elements }
  #  end
  #end
  
  require 'will_paginate'
  respond_to :html,:json,:xml
  
  protect_from_forgery :except => [:post_data]
  
  # Don't forget to edit routes if you're using RESTful routing
  # 
  #resources :elements,:only => [:index] do
  #   collection do
  #     post "post_data"
  #   end
  # end
  
 

  def post_data
    message=""
    element_params = { :id => params[:id],:name => params[:name] }
    case params[:oper]
    when 'add'
      if params["id"] == "_empty"
        element = Element.create(element_params)
        message << ('add ok') if element.errors.empty?
      end
      
    when 'edit'
      # JDavis todo: need to add logic such that only a manager or element author can edit an element name.
      element = Element.find_by_id(1)
      # JDavis todo: need to add logic such that a user
      @user_list = UserList.new
      @user_list.user_id = 1
      @user_list.element_id = 1
      @user_list.score = params[:rating]
      @user_list.iteration_id = 1 #JDavis todo: need to 
      
      message << ('update ok') if element.update_attributes(element_params) && @user_list.save
      
    when 'del'
      # JDavis: need to add logic such that only a manager or element author can delete.
      Element.destroy_all(:id => params[:id].split(","))
      message <<  ('del ok')
    when 'sort'
      elements = Element.all
      elements.each do |element|
        element.position = params['ids'].index(element.id.to_s) + 1 if params['ids'].index(element.id.to_s) 
        element.save
      end
      message << "sort ak"
    else
      message <<  ('unknown action')
    end
    
    unless (element && element.errors).blank?  
      element.errors.entries.each do |error|
        message << "<strong>#{Element.human_attribute_name(error[0])}</strong> : #{error[1]}<br/>"
      end
      render :json =>[false,message]
    else
      render :json => [true,message] 
    end
  end
  
  
  def index
    #index_columns ||= [:id,:name]
    #current_page = params[:page] ? params[:page].to_i : 1
    #rows_per_page = params[:rows] ? params[:rows].to_i : 10

    #conditions={:page => current_page, :per_page => rows_per_page}
    #conditions[:order] = params["sidx"] + " " + params["sord"] unless (params[:sidx].blank? || params[:sord].blank?)
    
    #if params[:_search] == "true"
    #  conditions[:conditions]=filter_by_conditions(index_columns)
    #end
    
    # JDavis: iteration will be selected from a dropdown.
    # hard coding at the moment.
    #@topic_group = TopicGroup.find_by_id(2)
    #@iteration = Iteration.find_by_id(1)
    #@elements=@iteration.elements.paginate(conditions)
    
    #total_entries=@elements.total_entries
    
    #respond_with(@elements) do |format|
    #  format.json { render :json => @elements.to_jqgrid_json(index_columns, current_page, rows_per_page, total_entries)}  
    #end
      

    #@elements = Element.all
    #@topic_group = TopicGroup.find_by_id(2)
    #@selected_topic = TopicGroup.find_by_id(2)
    #@topic_groups = TopicGroup.all
    #@iteration = Iteration.find_by_id(1)
    @elements= Element.all
    


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @elements }
    end

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
    @element = Element.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @element }
    end
  end

  # GET /elements/1/edit
  def edit
    @element = Element.find(params[:id])
  end

  # POST /elements
  # POST /elements.xml
  def create
    @element = Element.new(params[:element])
    #JDavis todo: New elements should only be current if the manager approves them
    @element.current = true 
    @element.created_by = current_user.id

    respond_to do |format|
      if @element.save
        format.html { redirect_to(@element, :notice => 'Element was successfully created.') }
        format.xml  { render :xml => @element, :status => :created, :location => @element }
      else
        format.html { render :action => "new" }
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
    @element = Element.find(params[:id])
    @element.destroy

    respond_to do |format|
      format.html { redirect_to(elements_url) }
      format.xml  { head :ok }
    end
  end
end
