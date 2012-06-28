# == Schema Information
#
# Table name: iterations
#
#  id              :integer(4)      not null, primary key
#  num             :integer(4)
#  consensus       :float
#  active          :boolean(1)
#  topic_group_id  :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#  consensus_topic :boolean(1)      default(TRUE)
#

require 'spec_helper'

describe Iteration do
  pending "add some examples to (or delete) #{__FILE__}"
end
