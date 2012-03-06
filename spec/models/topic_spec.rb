# == Schema Information
#
# Table name: topics
#
#  id               :integer(4)      not null, primary key
#  name             :string(255)
#  description      :text
#  status           :integer(4)      default(1)
#  update_frequency :integer(4)
#  due_days         :integer(4)
#  opt_out          :boolean(1)
#  company_id       :integer(4)
#  created_at       :datetime
#  updated_at       :datetime
#  goal             :integer(4)
#

require 'spec_helper'

describe Topic do
  pending "add some examples to (or delete) #{__FILE__}"
end
