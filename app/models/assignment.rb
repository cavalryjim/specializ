# == Schema Information
#
# Table name: assignments
#
#  id             :integer(4)      not null, primary key
#  user_id        :integer(4)
#  topic_group_id :integer(4)
#  manager        :boolean(1)
#  participating  :boolean(1)
#  created_at     :datetime
#  updated_at     :datetime
#

class Assignment < ActiveRecord::Base
  attr_accessible :user_id, :topic_group_id, :manager, :participating
  
  belongs_to :user
  belongs_to :topic_group
  
  after_initialize :default_values
  
  validates :user_id, :presence => true
  validates :topic_group_id, :presence => true
  validates :manager, :inclusion => {:in => [true, false]}
  validates :participating, :inclusion => {:in => [true, false]}
  
  private
    def default_values
      self.participating = true
    end
end
