ActiveAdmin.register User do
  index do
    column :id
    column :first_name
    column :last_name
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
      f.input :roles
    end
    f.buttons
  end
end
