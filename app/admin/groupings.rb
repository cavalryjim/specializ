ActiveAdmin.register Grouping do
  filter :company
  filter :parent
  filter :name
  filter :description
  filter :created_at
  
  index do
    column :id
    column :name do |grouping|
      link_to grouping, edit_admin_grouping_path(grouping)
    end
    column :description
    column :company
    column :parent
    
    default_actions
  end
  
  form do |f|
    f.inputs do 
      f.input :company
      f.input :parent
      f.input :name
      f.input :description
    end
    f.buttons
  end
end
