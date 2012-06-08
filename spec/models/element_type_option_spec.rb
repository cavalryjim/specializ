# == Schema Information
#
# Table name: element_type_options
#
#  id              :integer(4)      not null, primary key
#  name            :string(255)
#  encoded_value   :string(255)
#  element_type_id :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe ElementTypeOption do
  pending "add some examples to (or delete) #{__FILE__}"
end
