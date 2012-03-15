ActiveAdmin.register User do
  filter :company
  filter :first_name
  filter :last_name
  filter :email
  filter :active, :as => :select
  filter :created_at
  
  index do
    column :id
    column :first_name do |user|
      link_to user, edit_admin_user_path(user)
    end
    column :last_name do |user|
      link_to user, edit_admin_user_path(user)
    end
    column :email
    column :company
    
    default_actions
  end
  
  form do |f|
    f.inputs do 
      f.input :company
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :active
      f.input :roles, :as => :check_boxes
    end
    f.buttons
  end
end
