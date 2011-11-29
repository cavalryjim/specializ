# == Schema Information
#
# Table name: topic_groups
#
#  id                   :integer(4)      not null, primary key
#  name                 :string(255)
#  goal                 :integer(4)
#  active               :boolean(1)
#  update_frequency     :integer(4)
#  topic_id             :integer(4)
#  grouping_id          :integer(4)
#  created_at           :datetime
#  updated_at           :datetime
#  elements_spreadsheet :string(255)
#

class TopicGroup < ActiveRecord::Base
  attr_accessible :name, :goal, :active, :update_frequency, 
                  :topic_id, :grouping_id, :elements_spreadsheet
                  
  mount_uploader :elements_spreadsheet, ElementsSpreadsheetUploader
  
  belongs_to :topic
  belongs_to :grouping
  has_many  :assignments, :dependent => :destroy
  has_many  :users, :through => :assignments
  has_many  :iterations, :dependent => :destroy
  has_many  :participating_users, :through => :assignments,
            :class_name => "User",
            :source => :user,
            :conditions => ['assignments.participating = ?', true]   
  
  validates :name, :presence => true
  validates :goal, :presence => true
  validates :active, :inclusion => {:in => [true, false]}
  validates :topic_id, :presence => true
  validates :grouping_id, :presence => true
  
  after_create :create_first_iteration
  
  def close
    self.iterations.where('active = true').each do |iteration|
      iteration.close
    end
    
    self.active = false
    return self.save
  end
  
  private
    
    def create_first_iteration
      first_iteration = Iteration.new
      first_iteration.topic_group_id = self.id
      first_iteration.num = 1
      first_iteration.active = true
      first_iteration.save
    end
  
end
