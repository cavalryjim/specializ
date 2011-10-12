# == Schema Information
#
# Table name: topics
#
#  id               :integer(4)      not null, primary key
#  name             :string(255)
#  description      :string(255)
#  status           :integer(4)  #JDavis: 1 = open, 2 = closed, 3 = archived
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
end
