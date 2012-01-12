# == Schema Information
#
# Table name: companies
#
#  id              :integer(4)      not null, primary key
#  name            :string(255)
#  active          :boolean(1)
#  never_expires   :boolean(1)
#  expiration_date :date
#  created_at      :datetime
#  updated_at      :datetime
#

class Company < ActiveRecord::Base
  has_many :groupings
  has_many :topics, :dependent => :destroy
  has_many :users
  
  validates :name, :presence => true
  validates :active, :inclusion => {:in => [true, false]}
  
  #before_create :set_expiration_date
  
  private
  
  def set_expiration_date
    #self.expiration_date = Time.now
  end
  
end
