# == Schema Information
#
# Table name: topics
#
#  id               :integer(4)      not null, primary key
#  name             :string(255)
#  description      :string(255)
#  status           :integer(4)
#  update_frequency :integer(4)
#  due_days         :integer(4)
#  opt_out          :boolean(1)
#  company_id       :integer(4)
#  created_at       :datetime
#  updated_at       :datetime
#  goal             :integer(4)
#

class Topic < ActiveRecord::Base
  belongs_to :company
  has_many :topic_groups, :dependent => :destroy
  has_many :groupings, :through => :topic_groups
  
  attr_accessible :name, :description, :company_id, :status, :update_frequency, :due_days, :opt_out, :goal
  
  validates :name, :presence => true
  validates :company_id, :presence => true
  validates :goal, :inclusion => { :in => 1..100 }
  validates_uniqueness_of :name, :scope => [ :company_id ]    # Unique for [name, company]

  
  #JDavis: need to ensure the company_id is set.
  #before_create :set_company
  
  def update_groupings(grouping_ids)
    
    grouping_ids.each do |grouping_id|
      grouping = Grouping.find(grouping_id)
      grouping.add_to_topic(self)
    end
      
    groups_to_remove = TopicGroup.where(:topic_id => self.id).map(&:grouping_id) - grouping_ids.map(&:to_i)
      
    groups_to_remove.each do |grouping_id|
      grouping = Grouping.find(grouping_id)
      grouping.remove_from_topic(self.id)
    end
  end
  
  private
    
    #def set_company
    #  self.company_id = @current_user.company_id
    #end
end
