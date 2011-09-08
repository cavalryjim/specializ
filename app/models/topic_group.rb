class TopicGroup < ActiveRecord::Base
  belongs_to :topic
  belongs_to :grouping
  
  attr_accessible :all
end
