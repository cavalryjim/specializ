ActiveAdmin.register TopicGroup do
  filter :topic
  filter :grouping
  filter :name
  filter :created_at
  
  index do
    column :id
    column :name
    column :goal
    column :active
    column :due_date
    
    default_actions
  end
  
  form do |f|
    f.inputs do 
      f.input :topic
      f.input :grouping
      f.input :name
      f.input :goal, :hint => "Enter an integer between 0 - 100."
      f.input :active
      f.input :update_frequency, :hint => "Enter the number of days between automatically restarting the topic."
      f.input :due_date
      f.input :due_days, :hint => "Enter the number of days participants have to submit feedback."
      f.input :elements_spreadsheet, :hint => "This is not used at the moment."
    end
    f.buttons
  end
  
 
end
