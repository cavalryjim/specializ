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
  
  # JDavis: reference Railscasts episode 197 for more info on this helper method
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  # JDavis: reference Railscasts episode 197 for more info on this helper method
  def link_to_add_fields(name, f, association, view_path)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(view_path.to_s + association.to_s, :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  
end
