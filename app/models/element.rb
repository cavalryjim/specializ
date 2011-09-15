# == Schema Information
#
# Table name: elements
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  current    :boolean(1)
#  created_by :integer(4)
#  edited_by  :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Element < ActiveRecord::Base
  has_many :iteration_lists, :dependent => :destroy
  has_many :iterations, :through => :iteration_lists
  has_many :user_lists, :dependent => :destroy
  has_many :users, :through => :user_lists
end
