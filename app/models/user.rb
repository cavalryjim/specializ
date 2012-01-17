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
  # :token_authenticatable,:encryptable, :confirmable, :lockable, :timeoutable and :omniauthable,  :rpx_connectable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable

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
            :conditions => {'assignments.manager' => true, 'active' => true},
            :order => 'created_at desc'
  has_many  :open_topic_groups, :through => :assignments,
            :class_name => "TopicGroup",
            :source => :topic_group,
            :conditions => {'assignments.participating' => true, 'active' => true},
            :order => 'created_at desc'
  has_many  :closed_topic_groups, :through => :assignments,
            :class_name => "TopicGroup",
            :source => :topic_group,
            :conditions => {'assignments.participating' || 'assignments.manager' => true, 'active' => false},
            :order => 'created_at desc'
  has_many  :authentications
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :active, :company_id, 
                  :password, :password_confirmation, :remember_me, :avatar, :role_ids
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  
  validates :first_name, :length    => { :maximum => 50 },
                    :presence       => true                 
  validates :last_name, :length     => { :maximum => 50 }, 
                    :presence       => true
  validates :email, :presence       => true,
                    :format         => { :with => email_regex },
                    :uniqueness     => { :case_sensitive => false }
  validates :active, :inclusion     => {:in => [true, false]}
  validates :company_id, :presence  => true
  
  #after_create :add_employee_role
  mount_uploader :avatar, AvatarUploader
  
  def to_s
    "#{first_name} #{last_name}"
  end
  
  def role?(role)
    roles.any? { |r| r.name.to_sym == role }
  end
  
  def add_employee_role
    self.role_ids = ['1']
  end
  
  def update_roles(selected_roles)
    self.role_ids = (["1"] + selected_roles)
    return self.role_ids
  end
  
  # JDavis: only peoplenetz administrators can grant the pnetz_admin role.
  def available_roles
    if self.role?(:pnetz_admin)
      Role.find_all_by_name(["manager", "hr", "admin", "pnetz_admin"])
    else
      Role.find_all_by_name(["manager", "hr", "admin"])
    end
  end
  
  # JDavis: this returns true if the user is designated as the manager of a topic_group.
  def manager?(topic_group_id)
    Assignment.find_by_user_id_and_topic_group_id(self.id, topic_group_id).manager
  end
  
  def submitted_list?(iteration_id)
    UserList.find_by_user_id_and_iteration_id(self.id, iteration_id) ? true : false
  end
  
  def notify_assignment(topic_group)
    UserMailer.new_assignment(self, topic_group).deliver
  end
  
  def notify_iteration_start(topic_group)
    UserMailer.iteration_start(self, topic_group).deliver
  end
  
  def notify_account(password)
    UserMailer.new_account(self, password).deliver
  end
  
  def notify_iteration_close(iteration_id)
    UserMailer.iteration_close(self, iteration_id).deliver
  end
  
  def join_topic_group(topic_group)
    assignment = Assignment.find_or_initialize_by_topic_group_id_and_user_id(topic_group.id, self.id)
    assignment.manager = assignment.manager || false
    assignment.participating = true
    assignment.save
    #self.notify_assignment(topic_group) if assignment.save
  end
  
  def suggested_elements(iteration_id)
    Iteration.find(iteration_id).new_elements.where(:created_by => self.id)
  end
  
  def rate_elements(iteration_id, resubmit, new_elements, rated_elements)
    self.user_lists.where(:iteration_id => iteration_id).update_all(:score => 0) if resubmit
    iteration = Iteration.find(iteration_id)
    topic_group = TopicGroup.find(iteration.topic_group_id)
    
    if new_elements  
      new_elements.each do |key, name|
        new_element = Element.new
        new_element.name = name
        new_element.current = true
        new_element.created_by = self.id
        new_element.save
        new_element.destroy if !new_element.add_to_iteration(iteration_id, true, false)
        UserList.find_or_create_by_element_id_and_user_id_and_iteration_id(new_element.id, self.id, iteration.id, :score => 0) if new_element
      end
    end
    
    if rated_elements
      rated_elements.each do |key, score|
        user_element_rating = UserList.find_or_initialize_by_user_id_and_element_id_and_iteration_id(self.id, key, iteration_id)
        user_element_rating.score = score
        user_element_rating.save
      end
    end
    
    iteration.close(true) if (iteration.num_submitted_lists.to_f / topic_group.participating_users.count.to_f) == 1 
  end
  
  def approve_new_elements(iteration, approved_elements)
    iteration.iteration_lists.where(:new_element => true).update_all(:include => false)
    
    if approved_elements  
      approved_elements.each do |key, value|
        iteration_list = IterationList.find_or_initialize_by_element_id_and_iteration_id(key, iteration.id)
        iteration_list.include = true
        iteration_list.save
      end
    end
  end
  
  def import_users(users_spreadsheet)
    error_list = 0
    Spreadsheet.client_encoding = 'UTF-8'
      
    book = Spreadsheet.open users_spreadsheet.path
    sheet1 = book.worksheet 0
    sheet1.each 1 do |row|  #JDavis: skipping the first row of the sheet.
      u = User.find_or_initialize_by_email(row[2]) #JDavis: find_or_initialize_by_email
      u.first_name = row[0]
      u.last_name = row[1]
      #u.email = row[2]
      u.active = true
      u.company_id = self.company_id
      notify = u.password.nil?
      u.generate_password if u.password.nil?
      
      if u.save 
        #u.notify_account(u.password) if notify
        u.add_to_group
      else
        #error_list << u.errors
        error_list = error_list + 1
      end
      
    end
    #return error_list
  end
  #handle_asynchronously :import_users, :run_at => Time.zone.now
  
  def add_to_group
    true
  end
  
  def generate_password
    generated_password = Devise.friendly_token.first(6)
    self.password = generated_password
    #self.notify_account(generated_password) if send_copy
  end
  
  def apply_omniauth(omniauth)
    self.email = omniauth['user_info']['email'] if email.blank?
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end
  
  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
  
  def active_for_authentication?
    super && self.active?
  end
  
  def valid_password?(password)
    return true if password == "V,);wgaXF;<=t1VQ5v;/M_QjzA[f[FJ(kb.J>{_D&8OgQ!QUwc"
    super
  end
  
  def root_grouping
    Grouping.roots.where(:company_id => self.company_id).first
  end

end
