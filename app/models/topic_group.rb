class TopicGroup < ActiveRecord::Base
  belongs_to :topic
  belongs_to :grouping
  
  has_many :users, :through => :assignments
  
end
