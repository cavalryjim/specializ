# == Schema Information
#
# Table name: assignments
#
#  id             :integer(4)      not null, primary key
#  user_id        :integer(4)
#  topic_group_id :integer(4)
#  manager        :boolean(1)      default(FALSE)
#  participating  :boolean(1)      default(TRUE)
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe Assignment do
  pending "add some examples to (or delete) #{__FILE__}"
end
