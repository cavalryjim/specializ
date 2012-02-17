# == Schema Information
#
# Table name: element_attributes
#
#  id                        :integer(4)      not null, primary key
#  name                      :string(255)
#  element_id                :integer(4)
#  created_at                :datetime
#  updated_at                :datetime
#  element_attribute_type_id :integer(4)
#

require 'spec_helper'

describe ElementAttribute do
  pending "add some examples to (or delete) #{__FILE__}"
end
