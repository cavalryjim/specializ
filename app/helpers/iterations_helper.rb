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
    if iteration_active
      'Waiting approval'
    else
      'My suggestion'
    end
  end
  
  def e_attributes(element)
    # JDavis: fighting with eager loadings & N+1 crap....
    #element.element_attributes.find(:all, :include => :element)
    element.element_attributes.find(:all)
  end
  
  def assignment(topic_group_id, user)
    user.assignments.where(:topic_group_id => topic_group_id).first.id
  end
  
  def submission_status_image(iteration_id, participant)
    participant.submitted_list?(iteration_id) ? image_tag('icons/tick.png') : nil
  end
  
  def score(element, iteration_id)
    element.score(current_user.id ,@iteration.id)
  end
  
  def rating_method(element, iteration, participant)
  
    return stars(element, iteration, participant) if element.element_type.nil?
    
    case element.element_type.name
    when 'yes_no'
      select_tag(element.id, options_from_collection_for_select(element.element_type.element_type_options, "id", "name"), {:include_blank => 'Select one'} )
    else 
      stars(element, iteration, participant)
    end
    #JDavis: this is a good place for a case!
    #return instrument
  end
  
  def stars(element, iteration, participant)
    instrument = radio_button_tag row_name(element.id), 1, score(element, iteration.id) == 1, options = { :class => "jdstar", :disabled => (!iteration.active || !participant) } 
    instrument = instrument + (radio_button_tag row_name(element.id), 2, score(element, iteration.id) == 2, options = { :class => "jdstar", :disabled => (!iteration.active || !participant) }) 
    instrument = instrument + (radio_button_tag row_name(element.id), 3, score(element, iteration.id) == 3, options = { :class => "jdstar", :disabled => (!iteration.active || !participant) })
    instrument = instrument + (radio_button_tag row_name(element.id), 4, score(element, iteration.id) == 4, options = { :class => "jdstar", :disabled => (!iteration.active || !participant) }) 
    instrument = instrument + (radio_button_tag row_name(element.id), 5, score(element, iteration.id) == 5, options = { :class => "jdstar", :disabled => (!iteration.active || !participant) })
  end
  
end
