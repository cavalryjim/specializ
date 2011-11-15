# == Schema Information
#
# Table name: elements
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  current    :boolean(1)
#  created_by :integer(4)
#  edited_by  :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Element < ActiveRecord::Base
  has_many :iteration_lists, :dependent => :destroy
  has_many :iterations, :through => :iteration_lists
  has_many :user_lists, :dependent => :destroy
  has_many :users, :through => :user_lists
  
  validates :name, :presence => true
  validates :created_by, :presence => true
  validates :current, :inclusion => {:in => [true, false]}
  
  def score(user_id, iteration_id)
    user_score = UserList.find_by_element_id_and_user_id_and_iteration_id(self.id, user_id, iteration_id)
    return !user_score.nil? ? user_score.score : 0
  end
  
  def add_to_iteration(iteration_id)
    iteration_list_element = IterationList.new
    iteration_list_element.element_id = self.id
    iteration_list_element.iteration_id = iteration_id
    return iteration_list_element.save
  end
  
  def compute_agreement(iteration_id)
    iteration_list = IterationList.find_or_create_by_element_id_and_iteration_id(self.id, iteration_id)
    user_lists = self.user_lists(:conditions => { :iteration_id => iteration_id })
    if user_lists.size > 0
      iteration_list.avg_score = [user_lists.average('score')*20, 1 - user_lists.average('score')*20].max
    else
      iteration_list.avg_score = 0
    end
    if iteration_list.new_element == nil
      iteration_list.new_element = false
    end
    iteration_list.include = self.include?(iteration_id)
    return iteration_list.save
  end
  
  def include?(iteration_id)
    #total_submissions = UserList.find_by_element_id_and_iteration_id(self.id, iteration_id).count
    total_submissions = self.user_lists.count(:conditions => { :iteration_id => iteration_id })
    #total_scored = UserList.find_by_element_id_and_iteration_id(self.id, iteration_id).where('score > 0').count
    total_scored = self.user_lists.count(:conditions => {:iteration_id => iteration_id } && ['score > 0'] )
    if total_submissions > 0
      return (total_scored / total_submissions) >= 0.5 ? true : false
    else
      return false 
    end
  end
  
end
