# == Schema Information
#
# Table name: libraries
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  number      :string(255)
#  description :text
#  parent_id   :integer(4)
#  lft         :integer(4)
#  rgt         :integer(4)
#  depth       :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class Library < ActiveRecord::Base
  acts_as_nested_set
  
end
