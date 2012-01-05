class Ability
  include CanCan::Ability
  
  def initialize(user)
    
    if (user.role? :employee) && user.active
      can :read, Company do |company|
        company.id == user.company_id
      end
      can :read, Topic do |topic|
        topic.company_id == user.company_id
      end
      can :read, TopicGroup do |topic_group|
        topic_group.participating_users.include?(user)
      end
      can :manage, TopicGroup do |topic_group|
        topic_group.managers.include?(user)
      end
      can :manage, Assignment do |assignment|
        TopicGroup.find(assignment.topic_group_id).managers.include?(user)
      end
      can [:read, :update, :delete], Assignment do |assignment|
        assignment.user_id == user.id
      end
      can :manage, Iteration do |iteration|
        TopicGroup.find(iteration.topic_group_id).participating_users.include?(user) or
        TopicGroup.find(iteration.topic_group_id).managers.include?(user)
      end
      can [:create, :read], Element
      can :manage, Element do |element|
        element.created_by == user.id or
        TopicGroup.find(element.iterations.last.topic_group_id).managers.include?(user)
      end
      can :create, UserList
      can :manage, UserList do |user_list|
        user_list.user_id == user.id
      end
      can [:read, :update], User do |me|
        me.id == user.id
      end
      #can :create, Authentication
      can [:manage], Authentication do |auth|
        auth.user_id == user.id
      end
    end
    
    if (user.role? :manager) && user.active
      #can :manage, Element
      can :manage, Assignment do |assignment|
        User.find(assignment.user_id).company_id == user.company_id
      end
      can :create, Topic
      can :manage, Topic do |topic|
        topic.company_id == user.company_id
      end
      can :read, Grouping do |grouping|
        grouping.company_id == user.company_id
      end
      can [:create, :read, :update, :delete], TopicGroup do |topic_group|
        Topic.find(topic_group.topic_id).company_id == user.company_id
      end
      
    end
    
    if (user.role? :hr) && user.active
      can :create, Grouping
      can :manage, Grouping do |grouping|
        grouping.company_id == user.company_id
      end
      can :read, User do |company_user|
        company_user.company_id == user.company_id
      end
    end
    
    if (user.role? :admin) && user.active
      can :create, User
      can :manage, User do |company_user|
        company_user.company_id == user.company_id
      end
    end
    
    if (user.role? :pnetz_admin) && user.active
      can :manage, :all
    end
  end
end