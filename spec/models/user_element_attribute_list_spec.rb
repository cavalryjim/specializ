# == Schema Information
#
# Table name: user_element_attribute_lists
#
#  id                   :integer(4)      not null, primary key
#  user_id              :integer(4)
#  element_attribute_id :integer(4)
#  created_at           :datetime
#  updated_at           :datetime
#  encoded_value        :string(255)
#

require 'spec_helper'

describe UserElementAttributeList do
  pending "add some examples to (or delete) #{__FILE__}"
end
