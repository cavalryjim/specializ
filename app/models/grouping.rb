# == Schema Information
#
# Table name: groupings
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :string(255)
#  company_id  :integer(4)
#  parent_id   :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#  lft         :integer(4)
#  rgt         :integer(4)
#

class Grouping < ActiveRecord::Base
  acts_as_nested_set
  belongs_to :company
  has_and_belongs_to_many :users, :uniq => true
  has_many :topics, :through => :topic_groups
 
  
  def fullname
    return self.self_and_ancestors.map(&:name).join("- ")
  end
  
#  has_and_belongs_to_many(:groupings,
#    :join_table => "groupings_link",
#    :foreign_key => "grouping_a_id",
#    :association_foreign_key => "grouping_b_id")


  
end
