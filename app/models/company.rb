class Company < ActiveRecord::Base
  has_many :groupings
  has_many :topics
  has_many :users
  
  
end
