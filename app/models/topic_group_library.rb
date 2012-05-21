# == Schema Information
#
# Table name: topic_group_libraries
#
#  id             :integer(4)      not null, primary key
#  library_id     :integer(4)
#  topic_group_id :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#

class TopicGroupLibrary < ActiveRecord::Base
end
