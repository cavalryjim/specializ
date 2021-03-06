module TopicsHelper
  
  def is_manager?(manager)
    manager
  end
  
  def display_as_file_or_folder(library)
    if library.parent?
       "<span class='folder'>"+library.name+"</span>"
     else
       "<span class='file'>"+library.name+"</span>"
     end     
  end
  
  def library_selected?(topic_id, library_id)
    TopicLibrary.find_by_topic_id_and_library_id(topic_id, library_id)
  end
  
  def row_classes(topic_id, library)
    str = ""
    if library.parent?
      str = "parent" 
      str = str + " childSelected" if library.descendants_selected?(topic_id)
      
    end
    
    if library.child? 
      str = str + " child-of-node--" + library.ancestors.map(&:id).join("-") 
      library.ancestors.each do |group|
        str = str + " desendant-of-node--" + group.self_and_ancestors.map(&:id).join("-")
      end
    end
    
    return str
  end
  
  def staffing_confirmation(topic)
    if topic.assignments.size > 0
      "This will restaff the topic by removing existing participants.  Continue?"
    else
      "Staff the topic?"
    end
  end
  
  def highest_consensus(topic_group)
    topic_group.iterations.max_by{|i| i.consensus}.consensus if topic_group.consensus_topic?
  end
  
end
