module TopicsHelper
  
  def is_manager?(manager)
    manager
  end
  
  def display_as_file_or_folder(library)
    if library.parent?
       "<span class='folder'>"+library.display_name+"</span>"
     else
       "<span class='file'>"+library.display_name+"</span>"
     end     
  end
  
end
