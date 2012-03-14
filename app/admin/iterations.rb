ActiveAdmin.register Iteration do
  index do
    column :id
    column "Topic Group", :sortable => :topic_group_id do |iteration|
      link_to iteration.topic_group, edit_admin_iteration_path(iteration)
    end
    column :num
    column :consensus
    column :active
    
    
    default_actions
  end
end
