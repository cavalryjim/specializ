class User < ActiveRecord::Base
  
  def role?(role)
    roles.include? role.to_string
  end
  
end
