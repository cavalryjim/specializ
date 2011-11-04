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
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,:encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :rpx_connectable

  has_and_belongs_to_many :roles, :uniq => true
  has_and_belongs_to_many :groupings, :uniq => true
  belongs_to :company
  has_many :assignments, :dependent => :destroy
  has_many :topic_groups, :through => :assignments
  has_many :user_lists, :dependent => :destroy
  has_many :elements, :through => :user_lists
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :active, :company_id, :password, :password_confirmation, :remember_me
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  
  validates :first_name, :length    => { :maximum => 50 },
                    :presence  => true                 
  validates :last_name, :length     => { :maximum => 50 }, 
                    :presence   => true
  validates :email, :presence       => true,
                    :format         => { :with => email_regex },
                    :uniqueness     => { :case_sensitive => false }
  validates :active, :inclusion     => {:in => [true, false]}
  validates :company_id, :presence  => true
  
  #scope :belongs_company, where(:company_id => 2)
  
  def name
    first_name.to_str + " " + last_name.to_str
  end
  
  def role?(role)
    roles.any? { |r| r.name.to_sym == role }
  end
  
  def before_rpx_success(rpx_user)
    # Do something with rpx_user...
  end
  
  def before_rpx_auto_create(rpx_user)
    # Do something with rpx_user
  end

  
end
