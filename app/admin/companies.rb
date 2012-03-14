ActiveAdmin.register Company do
  filter :name
  filter :active, :as => :select
  filter :expiration_date
  filter :created_at
  
  index do
    column :id
    column :name do |company|
      link_to company, edit_admin_company_path(company)
    end
    column :active
    column :expiration_date
    column :logo
    
    default_actions
  end
end
