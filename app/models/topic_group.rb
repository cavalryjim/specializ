# == Schema Information
#
# Table name: topic_groups
#
#  id               :integer(4)      not null, primary key
#  name             :string(255)
#  goal             :integer(4)
#  active           :boolean(1)
#  update_frequency :integer(4)
#  topic_id         :integer(4)
#  grouping_id      :integer(4)
#  created_at       :datetime
#  updated_at       :datetime
#

class TopicGroup < ActiveRecord::Base
  belongs_to :topic
  belongs_to :grouping
  has_many :assignments, :dependent => :destroy
  has_many :users, :through => :assignments
  has_many :iterations, :dependent => :destroy
  
  validates :name, :presence => true
  validates :goal, :presence => true
  validates :active, :inclusion => {:in => [true, false]}
  validates :topic_id, :presence => true
  validates :grouping_id, :presence => true
  
  #def selected(topic_id, grouping_id)
  #  return ["2", "5"]
  #end
  
end
