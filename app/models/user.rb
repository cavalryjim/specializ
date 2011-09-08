class User < ActiveRecord::Base
  has_and_belongs_to_many :roles, :uniq => true
  has_and_belongs_to_many :groupings, :uniq => true
  belongs_to :company
  
  has_many :topic_groups, :through => :assignments
  
  
  def role?(role)
    roles.include? role.to_string
  end
  
end
