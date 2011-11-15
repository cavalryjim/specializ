# == Schema Information
#
# Table name: iterations
#
#  id             :integer(4)      not null, primary key
#  num            :integer(4)
#  consensus      :float
#  active         :boolean(1)
#  topic_group_id :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#

class Iteration < ActiveRecord::Base
  belongs_to :topic_group
  has_many :iteration_lists, :dependent => :destroy
  has_many :elements, :through => :iteration_lists
  has_many :user_lists, :dependent => :destroy
  
  validates :num, :presence => true
  validates :active, :inclusion => {:in => [true, false]}
  validates :topic_group_id, :presence => true
  
  def close
    self.elements.where('current = true').each do |element|
      element.avg_score(self.id)
    end
    self.active = false
    
    self.consensus = self.iteration_lists.average('avg_score')
    return self.save
  end
  
  def start
    true
  end
  
end
