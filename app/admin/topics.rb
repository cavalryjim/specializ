ActiveAdmin.register Topic do
  filter :company
  filter :name
  filter :description
  filter :status, :as => :select
  filter :created_at
  
  index do
    column :id
    column :name
    column :description
    column :status
    column :company
    
    default_actions
  end
  
  form do |f|
    f.inputs do 
      f.input :company
      f.input :name
      f.input :description
      f.input :goal, :hint => "Enter an integer between 0 - 100."
      f.input :status, :collection => [['Open', 1], ['Closed', 2], ['Archived', 3]], :as => :select
      f.input :update_frequency, :hint => "Enter the number of days between automatically restarting the topic."
      f.input :due_days, :hint => "Enter the number of days participants have to submit feedback."
    end
    f.buttons
  end
end
