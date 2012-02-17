class ElementAttributesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  respond_to :html,:json
  
  def show

    
  end
  
  def new
    @topic_group = TopicGroup.find_by_id(params[:topic_group_id])
    @iteration = Iteration.find_by_id(params[:iteration_id])
    @element = Element.find_by_id(params[:element_id])
    
  end
  
  def edit
    @topic_group = TopicGroup.find_by_id(params[:topic_group_id])
    @iteration = Iteration.find_by_id(params[:iteration_id])
    @element = Element.find(params[:element_id])
  end
  
  def update
    @element_attributes.update_attributes(params[:element])

    respond_with(@element_attributes)
  end
  
  def create
    @topic_group = TopicGroup.find_by_id(params[:topic_group_id])
    @iteration = Iteration.find_by_id(params[:iteration_id])
    @element = Element.find_by_id(params[:element_id])
    @element_attribute = Element.new(params[:element_attribute])
    #@element_attribute.element_id = @element.id

    respond_to do |format|
      if @element_attribute.save  
        gflash :success => "Attribute created."
        format.html { redirect_to topic_group_iteration_url(@topic_group, @iteration) }
      else
        gflash :error => "There was a problem adding that attribute."
        format.html { redirect_to topic_group_iteration_url(@topic_group, @iteration) }
        format.xml  { render :xml => @element_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @iteration = Iteration.find(params[:iteration_id])
    @topic_group = TopicGroup.find(@iteration.topic_group_id)
    @element = Element.find(params[:element_id])
    gflash :success => "Attribute removed." if @element_attribute.destroy

    respond_to do |format|
      format.html { redirect_to topic_group_iteration_url(@topic_group, @iteration) }
      format.xml  { head :ok }
    end
  end
  
end
