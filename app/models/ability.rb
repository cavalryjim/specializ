class Ability
  include CanCan::Ability
  
  def initialize(user)
    
    #if (user.role? :employee) && user.active
    if user.active  #JDavis: if all users have the 'employee' role, then why ask for it?
      can :read, Company do |company|
        company.id == user.company_id
      end
      can :read, Topic do |topic|
        topic.company_id == user.company_id
      end
      can :read, TopicGroup do |topic_group|
        topic_group.participating_users.include?(user)
        #topic_group.users.include?(user)
      end
      can :manage, TopicGroup do |topic_group|
        topic_group.managers.include?(user)
      end
      can :manage, Assignment do |assignment|
        assignment.new_record? or 
        TopicGroup.find(assignment.topic_group_id).managers.include?(user)
      end
      can [:read, :update, :delete], Assignment do |assignment|
        assignment.user_id == user.id
      end
      can :manage, Iteration do |iteration|
        iteration.new_record? or
        TopicGroup.find(iteration.topic_group_id).participating_users.include?(user) or
        TopicGroup.find(iteration.topic_group_id).managers.include?(user)
      end
      can :create, Element
      can :read, Element do |element|
        TopicGroup.find(element.iterations.last.topic_group_id).participating_users.include?(user)
      end
      can :manage, Element do |element|
        element.new_record? or 
        element.created_by == user.id or
        TopicGroup.find(element.iterations.last.topic_group_id).managers.include?(user)
      end
      can [:create, :read], ElementAttribute
      can :manage, ElementAttribute do |e_attribute|
        e_attribute.new_record? or
        e_attribute.element.created_by == user.id
      end
      can :create, UserList
      can :manage, UserList do |user_list|
        user_list.user_id == user.id
      end
      can :create, UserElementAttributeList
      can :manage, UserElementAttributeList do |list|
        list.new_record? or
        list.user_id == user.id
      end
      can [:manage], User do |me|
        me.id == user.id
      end
      can [:manage], Authentication do |auth|
        auth.new_record? or
        auth.user_id == user.id
      end
      can :read, Role
    end
    
    if (user.role? :manager) && user.active
      can :manage, Assignment do |assignment|
        assignment.new_record? or 
        User.find(assignment.user_id).company_id == user.company_id
      end
      can :create, Topic
      can :manage, Topic do |topic|
        topic.new_record? or
        topic.company_id == user.company_id
      end
      can :read, Grouping do |grouping|
        grouping.company_id == user.company_id
      end
      can [:create, :read, :update, :delete], TopicGroup do |topic_group|
        topic_group.new_record? or 
        Topic.find(topic_group.topic_id).company_id == user.company_id
      end
      can :manage, UserElementAttributeList
      
    end
    
    if (user.role? :hr) && user.active
      #can :create, Grouping
      can :manage, Grouping do |grouping|
        grouping.new_record? or
        grouping.company_id == user.company_id
      end
      can :read, User do |company_user|
        company_user.company_id == user.company_id
      end
    end
    
    if (user.role? :admin) && user.active
      #can :create, User
      can :manage, User do |company_user|
        company_user.new_record? or
        company_user.company_id == user.company_id
      end
      can :manage, LdapSetting do |ldap|
        ldap.new_record? or 
        ldap.company_id == user.company_id
      end
    end
    
    if (user.role? :pnetz_admin) && user.active
      can :manage, :all
    end
  end
end