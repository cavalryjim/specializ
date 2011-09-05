class Company < ActiveRecord::Base
  has_many :groupings
  has_may :topics
  
end
