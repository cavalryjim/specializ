ActiveAdmin.register Element do
  
  index do
    column :id
    column :name do |element|
      link_to element, edit_admin_element_path(element)
    end
    
    column :created_by
    column :created_at
    
    default_actions
  end
  
end
