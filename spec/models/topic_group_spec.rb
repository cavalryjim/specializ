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

require 'spec_helper'

describe TopicGroup do
  pending "add some examples to (or delete) #{__FILE__}"
end
