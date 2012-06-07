# == Schema Information
#
# Table name: elements
#
#  id              :integer(4)      not null, primary key
#  name            :string(255)
#  current         :boolean(1)
#  created_by      :integer(4)
#  edited_by       :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#  topic_group_id  :integer(4)
#  description     :text
#  mandatory       :boolean(1)
#  element_type_id :integer(4)
#

require 'spec_helper'

describe Element do
  pending "add some examples to (or delete) #{__FILE__}"
end
