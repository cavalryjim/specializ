# == Schema Information
#
# Table name: iteration_lists
#
#  id           :integer(4)      not null, primary key
#  iteration_id :integer(4)
#  element_id   :integer(4)
#  avg_score    :float
#  created_at   :datetime
#  updated_at   :datetime
#

class IterationList < ActiveRecord::Base
  belongs_to :iteration
  belongs_to :element
  
  validates :iteration_id, :presence => true
  validates :element_id, :presence => true
end
