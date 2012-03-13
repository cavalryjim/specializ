ActiveAdmin.register Topic do
  index do
    column :id
    column :name
    column :description
    column :status
    column :company
    
    default_actions
  end
end
