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
    return user_score.score if !user_score.nil?
    return 0
  end
  
  def add_to_iteration(iteration_id)
    iteration_list_element = IterationList.new
    iteration_list_element.element_id = self.id
    iteration_list_element.iteration_id = iteration_id
    return iteration_list_element.save
  end
  
  
end
