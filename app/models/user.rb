class User < ActiveRecord::Base
  has_and_belongs_to_many :roles, :uniq => true
  has_and_belongs_to_many :groupings, :uniq => true
  belongs_to :company
  has_many :assignments, :dependent => :destroy
  has_many :topic_groups, :through => :assignments
  has_many :user_lists, :dependent => :destroy
  has_many :elements, :through => :user_lists
  
  def name
    first_name.to_str + " " + last_name.to_str
  end
  
  def role?(role)
    roles.include? role.to_string
  end
  
end
