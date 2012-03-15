class UserMailer < ActionMailer::Base
  default :from => "no-reply@peoplenetz.com"
  
  def new_assignment(user, topic_group)
    @user = user
    @topic_group = topic_group
    mail(:to => "#{user.email}", :subject => 'Specializ: New Topic Assignment')
  end
  
  def iteration_start(user, topic_group)
    @user = user
    @topic_group = topic_group
    mail(:to => "#{user.email}", :subject => 'Specializ: Next Iteration')
  end
  
  def new_credentials(user, password)
    @user = user
    @password = password
    mail(:to => "#{user.email}", :subject => 'Specializ: Account Credentials')
  end
  
  def iteration_close(manager, iteration_id)
    @manager = manager
    @topic_group = TopicGroup.find(Iteration.find(iteration_id).topic_group_id)
    mail(:to => "#{manager.email}", :subject => 'Specializ: Iteration Closed')
  end
end
