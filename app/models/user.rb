class User < ActiveRecord::Base
  has_and_belongs_to_many :roles, :uniq => true
  has_and_belongs_to_many :groupings, :uniq => true
  
  def role?(role)
    roles.include? role.to_string
  end
  
end
