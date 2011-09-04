class Ability
  include CanCan::Ability
  
  def initialize(user)
    
    if user.role? :employee
      
    end
    
    if user.role? :manager
      
    end
    
    if user.role? :hr
    
    end
    
    if user.role? :admin
      
    end
    
    if user.role? :pnetz_admin
    
    end
  end
end