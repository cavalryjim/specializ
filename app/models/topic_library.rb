# == Schema Information
#
# Table name: topic_libraries
#
#  id         :integer(4)      not null, primary key
#  library_id :integer(4)
#  topic_id   :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class TopicLibrary < ActiveRecord::Base
  belongs_to :topic
  belongs_to :library
  
  attr_accessible :topic_id, :library_id
  
  validates :topic_id, :presence => true
  validates :library_id, :presence => true
  validates_uniqueness_of :library_id, :scope => [ :topic_id ]
  
end
