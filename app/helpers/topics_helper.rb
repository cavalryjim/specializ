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
  
end
