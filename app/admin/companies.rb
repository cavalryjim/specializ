ActiveAdmin.register Company do
  filter :name
  filter :active, :as => :select
  filter :expiration_date
  filter :created_at
  
  index do
    column :id
    column :name
    column :active
    column :expiration_date
    column :logo
    
    default_actions
  end
end
