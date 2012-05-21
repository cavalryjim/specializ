# == Schema Information
#
# Table name: elements
#
#  id             :integer(4)      not null, primary key
#  name           :string(255)
#  current        :boolean(1)
#  created_by     :integer(4)
#  edited_by      :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#  topic_group_id :integer(4)
#

class Element < ActiveRecord::Base
  
  belongs_to :topic_group
  has_many :iteration_lists, :dependent => :destroy
  has_many :iterations, :through => :iteration_lists
  has_many :user_lists, :dependent => :destroy
  has_many :users, :through => :user_lists
  has_many :element_attributes, :dependent => :destroy
  
  attr_accessible :name, :current, :created_by, :edited_by, :element_attributes_attributes, :topic_group_id
  validates :name,  :presence => true
  validates :created_by, :presence => true
  validates :current, :inclusion => {:in => [true, false]}
  #validates_associated :iteration
  #validates :name, :uniqueness => { :scope => :iteration_id, :message => 'item already exists'}

  
  accepts_nested_attributes_for :element_attributes, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  
  def to_s
    self.name
  end
  
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
    topic_group = TopicGroup.find(iteration.topic_group_id)
    iteration_list = IterationList.find_or_create_by_element_id_and_iteration_id(self.id, iteration_id)
    user_lists = self.user_lists.where( :iteration_id => iteration_id )
    total_participants = topic_group.participating_users.size
    
    if user_lists.size > 0
      sum = user_lists.sum('score')
      agreement = (sum * 20)  / total_participants.to_f
      iteration_list.agreement = [ agreement, 100 - agreement ].max
      iteration_list.include = self.include?(iteration_id, total_participants)
    else
      iteration_list.agreement = 100
      iteration_list.include = false
    end
    
    iteration_list.new_element = false if iteration_list.new_element == nil
    
    return iteration_list.save
  end
  
  def include?(iteration_id, total_participants)
    total_scored = self.user_lists.where('iteration_id = ? AND score > 0 ', iteration_id).size
    if ((total_scored.to_f / total_participants.to_f) >= 0.5)
      true
    else
      false
    end
    
  end
  
  def approved?(iteration_id)
    IterationList.find_by_element_id_and_iteration_id(self.id, iteration_id).include
  end
  
  def has_attributes?
    self.element_attributes.first
  end
  
  def unique_to_iteration?(iteration_id)
    !Iteration.find(iteration_id).elements.map{ |e| e.name.downcase }.include?(self.name.downcase)
  end
  
end
