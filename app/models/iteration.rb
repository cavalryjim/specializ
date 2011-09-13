class Iteration < ActiveRecord::Base
  belongs_to :topic_group
  has_many :iteration_lists, :dependent => :destroy
  has_many :elements, :through => :iteration_lists
  has_many :user_lists, :dependent => :destroy
  
end
