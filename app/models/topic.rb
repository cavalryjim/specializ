class Topic < ActiveRecord::Base
  belongs_to :company
  has_many :topic_groups
  
  
end
