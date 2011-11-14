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
#

class Topic < ActiveRecord::Base
  belongs_to :company
  has_many :topic_groups, :dependent => :destroy
  has_many :groupings, :through => :topic_groups
  
  validates :name, :presence => true
  validates :company_id, :presence => true
  
  #JDavis: need to ensure the company_id is set.
  before_create :set_company
  
  private
    
    def set_company
      self.company_id = current_user.company_id
    end
end
