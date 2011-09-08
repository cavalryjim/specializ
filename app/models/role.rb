class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :uniq => true
  
  attr_accessible :all
  
end
