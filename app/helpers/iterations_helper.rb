module IterationsHelper
  
  def row_name(element_id)
    'rating['+element_id.to_s+']'
  end
  
  def confirm_dialogue(submitted)
    if submitted
      'Resubmit your list? Previous ratings will be overwritten.'
    else
      'Submit your list?' 
    end
  end
  
  def my_suggestion(iteration_active)
    if @iteration_active
      'Waiting approval'
    else
      'My suggestion'
    end
  end
  
  def e_attributes(element)
    element.element_attributes
  end
  
end
