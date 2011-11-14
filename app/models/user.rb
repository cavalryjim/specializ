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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,:encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :rpx_connectable

  has_and_belongs_to_many :roles, :uniq => true
  has_and_belongs_to_many :groupings, :uniq => true
  belongs_to :company
  has_many  :assignments, :dependent => :destroy
  has_many  :topic_groups, :through => :assignments
  has_many  :user_lists, :dependent => :destroy
  has_many  :elements, :through => :user_lists
  has_many  :managed_topic_groups, :through => :assignments,
            :class_name => "TopicGroup",
            :source => :topic_group,
            :conditions => ['assignments.manager = ?', true]
  has_many  :my_topic_groups, :through => :assignments,
            :class_name => "TopicGroup",
            :source => :topic_group,
            :conditions => ['assignments.participating = ?', true]
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :active, :company_id, 
                  :password, :password_confirmation, :remember_me, :avatar
  
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
  
  mount_uploader :avatar, AvatarUploader
  
  #scope :belongs_company, where(:company_id => 2)
  
  def name
    first_name.to_str + " " + last_name.to_str
  end
  
  def role?(role)
    roles.any? { |r| r.name.to_sym == role }
  end
  
  # JDavis: only peoplenetz administrators can grant the pnetz_admin role.
  def available_roles
    if self.role?(:pnetz_admin)
      Role.all
    else
      Role.find(:all, :conditions => ["name!=?", "pnetz_admin"])
    end
  end
  
  # JDavis: this returns true if the user is designated as the manager of a topic_group.
  def manager?(topic_group_id)
    Assignment.find_by_user_id_and_topic_group_id(self.id, topic_group_id).manager
  end
  
  def submitted_list?(iteration_id)
    if UserList.find_by_user_id_and_iteration_id(self.id, iteration_id)
      false
    else
      true
    end
  end
  
  def before_rpx_success(rpx_user)
    # Do something with rpx_user...
  end
  
  def before_rpx_auto_create(rpx_user)
    # Do something with rpx_user
  end

  
end
