class TopicGroup < ActiveRecord::Base
  belongs_to :topic
  belongs_to :grouping
  has_many :assignments, :dependent => :destroy
  has_many :users, :through => :assignments
  has_many :iterations, :dependent => :destroy
  
end
