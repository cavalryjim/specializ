class Company < ActiveRecord::Base
  has_many :groupings
  has_may :topics
  
  attr_accessible :all
  
end
