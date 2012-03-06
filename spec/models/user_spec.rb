# == Schema Information
#
# Table name: users
#
#  id                     :integer(4)      not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  email                  :string(255)
#  active                 :boolean(1)
#  created_at             :datetime
#  updated_at             :datetime
#  company_id             :integer(4)
#  encrypted_password     :string(255)
#  password_salt          :string(255)
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer(4)      default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  encryptor              :string(255)
#  pepper                 :string(255)
#  rpx_identifier         :string(255)
#  avatar                 :string(255)
#

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
