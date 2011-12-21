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
