module ApplicationHelper
  
  # Return a title on a per-page basis.
  def title
    base_title = "Micro Blog"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("specializ.png", :alt => "Specializ", :class => "round")
  end
  
end
