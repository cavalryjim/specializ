class Topic < ActiveRecord::Base
  belongs_to :company
  has_many :topic_groups, :dependent => :destroy
  has_many :groupings, :through => :topic_groups
  
  
end
