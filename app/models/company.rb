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
  
  
end
