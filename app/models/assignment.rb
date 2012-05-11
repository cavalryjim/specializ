# == Schema Information
#
# Table name: assignments
#
#  id             :integer(4)      not null, primary key
#  user_id        :integer(4)
#  topic_group_id :integer(4)
#  manager        :boolean(1)      default(FALSE)
#  participating  :boolean(1)      default(TRUE)
#  created_at     :datetime
#  updated_at     :datetime
#

class Assignment < ActiveRecord::Base
  attr_accessible :user_id, :topic_group_id, :manager, :participating
  
  belongs_to :user
  belongs_to :topic_group
  
  validates :user_id, :presence => true
  validates :topic_group_id, :presence => true
  validates_associated :user
  validates_associated :topic_group
  validates :manager, :inclusion => {:in => [true, false]}
  validates :participating, :inclusion => {:in => [true, false]}
  
  def user_last_name
    self.user.last_name
  end
  
end



