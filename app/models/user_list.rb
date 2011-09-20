# == Schema Information
#
# Table name: user_lists
#
#  id           :integer(4)      not null, primary key
#  user_id      :integer(4)
#  element_id   :integer(4)
#  score        :integer(4)
#  iteration_id :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

class UserList < ActiveRecord::Base
  belongs_to :user
  belongs_to :element
  belongs_to :iteration
  
  validates :user_id, :presence => true
  validates :element_id, :presence => true
  validates :score, :presence => true
  validates :iteration_id, :presence => true
end
