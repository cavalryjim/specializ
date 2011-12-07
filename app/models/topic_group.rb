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
  accepts_nested_attributes_for :iterations
  
  def close
    self.iterations.where('active = true').each do |iteration|
      iteration.close
    end
    
    self.active = false
    return self.save
  end
  
  def bar_chart
    #consensus_data = self.iterations.map { |i| i.consensus }
    #x_axis = self.iterations.map { |a| a.num.to_s }
    consensus_data = [[10,10,30], [nil,nil,nil,50,60]]
    x_axis = [1,2,3,4,5,6]
    y_axis = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    bar_chart = Gchart.bar(:title => "Consensus Levels",
                            :title_alignment => :left,
                            :title_size => 15,
                            :data => consensus_data, 
                            :stacked => false,
                            :grouped => false,
                            :bg => 'efefef',
                            :bar_colors => ['FF0000', '00FF00'],
                            :bar_width_and_spacing => '20,6',
                            :axis_with_labels => ['x', 'y'],
                            :axis_labels => [x_axis, y_axis],
                            :legend => ["Consensus not reached", "Consensus goal reached"],
                            :width => 900,
                            :height => 240, 
                            :max_value => 100)
  end
  
  private
    
    def create_first_iteration
      first_iteration = Iteration.new
      first_iteration.topic_group_id = self.id
      first_iteration.num = 1
      first_iteration.active = false
      first_iteration.save
    end
  
end
