class Ability
  include CanCan::Ability
  
  def initialize(user)
    
    if user.role? :employee
      can :read, Element
      can :read, TopicGroup
      can :create, Element
    end
    
    if user.role? :manager
      can :manage, Element
      can :manage, Assignment
      can :manage, Topic
      can :manage, TopicGroup
    end
    
    if user.role? :hr
      can :manage, Grouping
    end
    
    if user.role? :admin
      can :manage, User
    end
    
    if user.role? :pnetz_admin
      can :manage, :all
    end
  end
end