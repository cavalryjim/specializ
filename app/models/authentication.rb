# == Schema Information
#
# Table name: authentications
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  provider   :string(255)
#  uid        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Authentication < ActiveRecord::Base
  belongs_to :user
  
  def provider_name
    if provider == 'open_id'
      "OpenID"
    elsif provider == 'linked_in'
      "LinkedIn"
    else
      provider.titleize
    end
  end
    
end



