class Topic < ActiveRecord::Base
  belongs_to :company
  has_many :groupings, through => :topic_groups
  
  
end
