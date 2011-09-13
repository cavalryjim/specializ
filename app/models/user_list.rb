class UserList < ActiveRecord::Base
  belongs_to :user
  belongs_to :element
  belongs_to :iteration
  
end
