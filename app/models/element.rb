class Element < ActiveRecord::Base
  has_many :iteration_lists, :dependent => :destroy
  has_many :iterations, :through => :iteration_lists
  has_many :user_lists, :dependent => :destroy
  has_many :users, :through => :user_lists
end
