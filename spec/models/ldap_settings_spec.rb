# == Schema Information
#
# Table name: ldap_settings
#
#  id                     :integer(4)      not null, primary key
#  company_id             :integer(4)
#  server_address         :string(255)
#  port_number            :integer(4)
#  user_name              :string(255)
#  password               :string(255)
#  root_node              :string(255)
#  account_attribute_name :string(255)
#  group_attribute_name   :string(255)
#  group_member_attribute :string(255)
#  group_names            :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

require 'spec_helper'

describe LdapSettings do
  pending "add some examples to (or delete) #{__FILE__}"
end
