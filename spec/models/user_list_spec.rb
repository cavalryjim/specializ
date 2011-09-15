# == Schema Information
#
# Table name: user_lists
#
#  id           :integer(4)      not null, primary key
#  user_id      :integer(4)
#  element_id   :integer(4)
#  score        :integer(4)
#  iteration_id :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe UserList do
  pending "add some examples to (or delete) #{__FILE__}"
end
