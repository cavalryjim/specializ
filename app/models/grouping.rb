class Grouping < ActiveRecord::Base
  acts_as_nested_set
  belongs_to :company
  has_and_belongs_to_many :users, :uniq => true
  has_many :topic_groups
  
  attr_accessible :all
  
  def fullname
    return self.self_and_ancestors.map(&:name).join("- ")
  end
  
#  has_and_belongs_to_many(:groupings,
#    :join_table => "groupings_link",
#    :foreign_key => "grouping_a_id",
#    :association_foreign_key => "grouping_b_id")


  
end
