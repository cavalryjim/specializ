class Topic < ActiveRecord::Base
  belongs_to :company
  has_many :topic_groups
  
  attr_accessible :name, :description, :status, :update_frequency, :due_days, :opt_out, :company_id
  
end
