class ElementAttributesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  respond_to :html,:json
  
  def new
    
  end
  
  def edit
    
  end
  
  def update
    #params[:element][:edited_by] = current_user.id #JDavis: identifying the last user to edit this element
    @element_attributes.update_attributes(params[:element])

    respond_with(@element_attributes)
  end
  
end
