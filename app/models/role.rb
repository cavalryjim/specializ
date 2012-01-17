# == Schema Information
#
# Table name: roles
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Role < ActiveRecord::Base
  attr_accessible :name, :description
  has_and_belongs_to_many :users, :uniq => true
  
  validates :name, :presence       => true,
                   :uniqueness     => { :case_sensitive => false }
    
end
