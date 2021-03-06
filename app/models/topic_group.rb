# == Schema Information
#
# Table name: topic_groups
#
#  id                   :integer(4)      not null, primary key
#  name                 :string(255)
#  goal                 :integer(4)
#  active               :boolean(1)      default(TRUE)
#  update_frequency     :integer(4)
#  topic_id             :integer(4)
#  grouping_id          :integer(4)
#  created_at           :datetime
#  updated_at           :datetime
#  elements_spreadsheet :string(255)
#  due_date             :date
#  due_days             :integer(4)
#

class TopicGroup < ActiveRecord::Base
  attr_accessible :name, :goal, :active, :update_frequency, :due_date, :due_days,
                  :topic_id, :grouping_id, :elements_spreadsheet, :participating_users
                  
  mount_uploader :elements_spreadsheet, ElementsSpreadsheetUploader
  
  belongs_to :topic
  belongs_to :grouping
  has_many  :assignments, :dependent => :destroy
  has_many  :users, :through => :assignments
  has_many  :iterations, :dependent => :destroy, :order => 'num'
  has_many  :elements, :dependent => :destroy
  has_many  :participating_users, :through => :assignments,
            :class_name => "User",
            :source => :user,
            :conditions => ['assignments.participating = ?', true]   
  has_many  :managers, :through => :assignments,
            :class_name => "User",
            :source => :user,
            :conditions => ['assignments.manager = ?', true]   
  
  validates :name, :presence => true
  validates :goal, :inclusion => { :in => 1..100 }, :if => :consensus_topic?
  validates :active, :inclusion => {:in => [true, false]}
  validates :topic_id, :presence => true
  validates :grouping_id, :presence => true
  
  after_create :create_first_iteration
  #after_create :set_due_date
  accepts_nested_attributes_for :iterations
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
  
  def to_s
    self.name
  end
  
  def close
    self.iterations.where('active = true').each do |iteration|
      iteration.close
    end
    
    self.active = false
    return self.save
  end
  
  def bar_chart
    below_goal = [] # array to hold iteration.consensus values that are below the topic_group.goal
    above_goal = [] # array to hold iteration.consensus values that have reached the topic_group.goal
    self.iterations.order(:num).each do |iteration|
      if iteration.consensus.to_f < self.goal.to_f
        below_goal << iteration.consensus
        above_goal << nil
      else
        below_goal << nil
        above_goal << iteration.consensus
      end
    end
    #consensus_data = self.iterations.map { |i| i.consensus } #JDavis had to take this out to get red vs. green bars.
    consensus_data = [below_goal, above_goal]
    
    x_axis = self.iterations.order(:num).map { |a| a.num.to_s }
    y_axis = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    bar_chart = Gchart.bar( :title => "Consensus Levels",
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
                            :width => 700,
                            :height => 240, 
                            :max_value => 100,
                            :use_ssl => true)
  end
  
  def staff(users)
    users.each do |user|
      user.join_topic_group(self)
    end
  end
  
  def import_elements(elements_spreadsheet, current_user_id)
    #self.elements_spreadsheet = elements_spreadsheet
    
    Spreadsheet.client_encoding = 'UTF-8'
      
    book = Spreadsheet.open elements_spreadsheet.path
    #book = Spreadsheet.open '../../public/uploads/topic_group/elements_spreadsheet/1/spz_test_upload.xls'
    sheet1 = book.worksheet 0
    sheet1.each 1 do |row|  #JDavis: skipping the first row of the sheet.
      if row.length == 1
        e = Element.new
        e.name = row[0]
        e.current = true
        e.created_by = current_user_id
        e.topic_group_id = self.id
        if e.save 
          if !e.add_to_iteration(self.iterations.last.id, false, true)
            e.destroy #JDavis: no orphan elements.
          end
        end
      else
        a = ElementAttribute.new
        a.name = row[1]
        a.input_type = row[2]
        a.element_id = e.id
        a.save
      end
    end 
  end
  
  def export_elements
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet :name => 'Iteration: ' + self.iterations.last.num.to_s
    i = 0
    self.iterations.last.elements.each do |element|
      i = i + 1
      sheet1.row(i).push element.name.to_s, element.iteration_lists.where(:iteration_id => self.iterations.last.id).first.agreement
      if element.has_attributes?
        element.element_attributes.each do |attribute|
          i = i + 1
          sheet1.row(i).push ' - ' + attribute.name.to_s, attribute.avg
        end
      end
    end
 
    file_path = Rails.root + 'tmp/' + "#{id}-#{name.parameterize}.xls"
    book.write file_path
    return file_path

  end
  
  def notify_users_new_iteration
    self.participating_users.each do |user|
      user.notify_iteration_start(self)
    end
  end
  
  def set_due_date
    if self.due_days.present?
      self.due_date = Date.today + self.due_days 
      self.save
      return self.due_date
    end
    
    return false
  end
  
  def consensus_topic?
    self.topic.consensus_topic?
  end
  
  
  private
    
    def create_first_iteration
      Iteration.create(:topic_group_id => self.id, :num => 1, :active => false, :consensus => 0.0, :consensus_topic => self.consensus_topic?)
    end
  
end



