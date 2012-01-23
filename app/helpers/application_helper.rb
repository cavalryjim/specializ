module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Specializ"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("specializ.png", :alt => "Specializ")
  end
  
  def company_logo
    company = Company.find(current_user.company_id)
    image_tag(company.logo, :alt => company.name) if company.logo
  end
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end
  
end
