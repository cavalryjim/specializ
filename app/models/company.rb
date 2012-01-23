# == Schema Information
#
# Table name: companies
#
#  id              :integer(4)      not null, primary key
#  name            :string(255)
#  active          :boolean(1)      default(TRUE)
#  never_expires   :boolean(1)      default(FALSE)
#  expiration_date :date
#  created_at      :datetime
#  updated_at      :datetime
#  logo            :string(255)
#

class Company < ActiveRecord::Base
  has_many :groupings
  has_many :topics, :dependent => :destroy
  has_many :users
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :active, :never_expires, :expiration_date, :logo
  
  validates :name,    :presence => true,
                      :uniqueness => { :case_sensitive => false }
  validates :active,  :inclusion => {:in => [true, false]}
  
  SUBSCRIPTION_PERIOD = 1.year
  
  before_create :set_expiration_date
  after_create :create_company_group
  
  private
  
  def set_expiration_date
    self.expiration_date = SUBSCRIPTION_PERIOD.from_now.end_of_month
  end
  
  def create_company_group
    Grouping.create(:name => self.name, :company_id => self.id)
  end
  
end



