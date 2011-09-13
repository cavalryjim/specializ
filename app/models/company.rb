class Company < ActiveRecord::Base
  has_many :groupings
  has_many :topics, :dependent => :destroy
  has_many :users
  
  
end
