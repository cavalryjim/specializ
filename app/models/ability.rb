class Ability
  include CanCan::Ability
  
  def initialize(user)
    
    if user.role? :employee
      can :read, TopicGroup do |topic_group|
        topic_group.participating_users.include?(user)
      end
      can :read, Iteration do |iteration|
        TopicGroup.find(iteration.topic_group.id).participating_users.include?(user)
      end
      can :read, Topic do |topic|
        topic.company_id == user.company_id
      end
      can :create, :read, Element
      can :update, :delete, Element do |element|
        element.created_by == user.id
      end
      can :manage, TopicGroup do |topic_group|
        topic_group.managers.include?(user)
      end
    end
    
    if user.role? :manager
      #can :manage, Element
      can :manage, Assignment
      #can :manage, Topic do |topic|
      #  topic.company_id == user.company_id
      #end
      can :manage, Topic
      can :read, Grouping
      can :manage, TopicGroup
      
    end
    
    if user.role? :hr
      can :manage, Grouping do |grouping|
        grouping.company_id == user.company_id
      end
    end
    
    if user.role? :admin
      can :manage, User do |company_user|
        company_user.company_id == user.company_id
      end
    end
    
    if user.role? :pnetz_admin
      can :manage, :all
    end
  end
end