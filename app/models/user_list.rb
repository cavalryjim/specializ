# == Schema Information
#
# Table name: user_lists
#
#  id            :integer(4)      not null, primary key
#  user_id       :integer(4)
#  element_id    :integer(4)
#  score         :integer(4)
#  iteration_id  :integer(4)
#  created_at    :datetime
#  updated_at    :datetime
#  encoded_value :string(255)
#

class UserList < ActiveRecord::Base
  belongs_to :user
  belongs_to :element
  belongs_to :iteration
  
  attr_accessible :user_id, :element_id, :score, :iteration_id, :encoded_value
                  
  validates :user_id, :presence => true
  validates :element_id, :presence => true
  validates :score, :presence => true, :if => :consensus_topic?
  validates :encoded_value, :presence => true, :if => :non_consensus_topic?
  validates :iteration_id, :presence => true
  
  def consensus_topic?
    self.iteration.consensus_topic?
  end
  
  def non_consensus_topic?
    !self.consensus_topic?
  end
  
  def value
    YAML.parse(self.encoded_value).transform if self.encoded_value
  end
  
  def encode(value)
    self.encoded_value = value.to_yaml
  end
  
end
