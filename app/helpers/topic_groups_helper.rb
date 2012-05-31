module TopicGroupsHelper
  
  def display_as_file_or_folder(library)
    if library.parent?
       "<span class='folder'>"+library.name+"</span>"
     else
       "<span class='file'>"+library.name+"</span>"
     end     
  end
  
  def library_selected?(topic_group_id, library_id)
    TopicGroupLibrary.find_by_topic_group_id_and_library_id(topic_group_id, library_id)
  end
  
  def row_classes(topic_group_id, library)
    str = ""
    if library.parent?
      str = "parent" 
      str = str + " childSelected" if library.descendants_selected?(topic_group_id)
      
    end
    
    if library.child? 
      str = str + " child-of-node--" + library.ancestors.map(&:id).join("-") 
      library.ancestors.each do |group|
        str = str + " desendant-of-node--" + group.self_and_ancestors.map(&:id).join("-")
      end
    end
    
    return str
  end
  
end
