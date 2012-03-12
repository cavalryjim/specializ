ActiveAdmin.register Company do
  index do
    column :id
    column :name
    column :active
    column :expiration_date
    column :logo
    
    default_actions
  end
end
