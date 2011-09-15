# == Schema Information
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  active     :boolean(1)
#  created_at :datetime
#  updated_at :datetime
#  company_id :integer(4)
#

class User < ActiveRecord::Base
  has_and_belongs_to_many :roles, :uniq => true
  has_and_belongs_to_many :groupings, :uniq => true
  belongs_to :company
  has_many :assignments, :dependent => :destroy
  has_many :topic_groups, :through => :assignments
  has_many :user_lists, :dependent => :destroy
  has_many :elements, :through => :user_lists
  
  attr_assessible :first_name, :last_name, :email, :active
  
  def name
    first_name.to_str + " " + last_name.to_str
  end
  
  def role?(role)
    roles.include? role.to_string
  end
  
end
