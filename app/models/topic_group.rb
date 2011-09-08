class TopicGroup < ActiveRecord::Base
  belongs_to :topic
  belongs_to :grouping
  
end
