# == Schema Information
#
# Table name: ldap_settings
#
#  id                     :integer(4)      not null, primary key
#  company_id             :integer(4)
#  server_address         :string(255)
#  port_number            :integer(4)
#  user_name              :string(255)
#  encrypted_password     :string(255)
#  root_node              :string(255)
#  account_attribute_name :string(255)
#  group_attribute_name   :string(255)
#  group_member_attribute :string(255)
#  group_names            :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  validated              :boolean(1)
#

class LdapSetting < ActiveRecord::Base
  belongs_to :company
  
  attr_accessible :company_id, :server_address, :port_number, :user_name, :root_node, :account_attribute_name, 
                  :group_attribute_name, :group_member_attribute, :group_names, :encrypted_password
  #attr_accessor :id
  #attr_encrypted :password, :key => 'bnalBEL6FSLKmFug10xM1IP94J29Iqe0'  #JDavis: encryption algorithm is aes-256-cbc
  
  validates :company_id,             :presence => true 
  validates :server_address,         :presence => true 
  validates :port_number,            :presence => true 
  validates :user_name,              :presence => true 
  validates :root_node,              :presence => true 
  validates :account_attribute_name, :presence => true 
  validates :group_attribute_name,   :presence => true 
  validates :group_member_attribute, :presence => true 
  validates :group_names,            :presence => true 
  validates :encrypted_password,     :presence => true
  
  #before_save :encrypt_password
  
  secret_key = Digest::SHA1.hexdigest('bnalBEL6FSLKmFug10xM1IP94J29Iqe0')
  @@encryptor = ActiveSupport::MessageEncryptor.new(secret_key)

  
  def encrypt_password(password)
    self.encrypted_password = @@encryptor.encrypt(password)
  end
  
  def password
    @@encryptor.decrypt(self.encrypted_password) if self.encrypted_password
  end
  
end
