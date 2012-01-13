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
  #require 'appropriate_validator'
  has_many :iteration_lists, :dependent => :destroy
  has_many :iterations, :through => :iteration_lists
  has_many :user_lists, :dependent => :destroy
  has_many :users, :through => :user_lists
  
  validates :name,  :presence => true
                    #:appropriate => true
  validates :created_by, :presence => true
  validates :current, :inclusion => {:in => [true, false]}
  
  def score(user_id, iteration_id)
    user_score = UserList.find_by_element_id_and_user_id_and_iteration_id(self.id, user_id, iteration_id)
    return user_score.nil? ? 0 : user_score.score
  end
  
  def add_to_iteration(iteration_id, new_element, include)
    iteration_list = IterationList.find_or_initialize_by_element_id_and_iteration_id(self.id, iteration_id)
    iteration_list.include = include
    iteration_list.new_element = new_element
    return iteration_list.save
  end
  
  def compute_agreement(iteration_id)
    iteration = Iteration.find(iteration_id)
    iteration_list = IterationList.find_or_create_by_element_id_and_iteration_id(self.id, iteration_id)
    user_lists = self.user_lists(:conditions => { :iteration_id => iteration_id })
    if user_lists.size > 0 && iteration.num_submitted_lists > 0
      total_submissions = iteration.num_submitted_lists
      sum = user_lists.sum('score')
      agreement = (sum * 20)  / total_submissions
      iteration_list.agreement = [ agreement, 100 - agreement].max
      iteration_list.include = self.include?(iteration_id, total_submissions)
    else
      iteration_list.agreement = 100
      iteration_list.include = false
    end
    
    iteration_list.new_element = false if iteration_list.new_element == nil
    
    return iteration_list.save
  end
  
  def include?(iteration_id, total_submissions)
    total_scored = self.user_lists.count(:conditions => {:iteration_id => iteration_id } && ['score > 0'] )
 
    return ((total_scored.to_f / total_submissions.to_f) >= 0.5) ? true : false
  end
  
  def approved?(iteration_id)
    IterationList.find_by_element_id_and_iteration_id(self.id, iteration_id).include
  end
  
end
