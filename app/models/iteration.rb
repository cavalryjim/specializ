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
      element.compute_agreement(self.id)
    end
    self.active = false
    
    self.consensus = self.iteration_lists.average('avg_score')
    return self.save
  end
  
  def start_new_iteration
    new_iteration = Iteration.new
    new_iteration.num = self.num + 1
    new_iteration.active = true
    new_iteration.topic_group_id = self.id
    new_iteration.save
    new_iteration.elements = self.elements.where('current = true')
    return new_iteration.id
  end
  
end
