class UserMailer < ActionMailer::Base
  default :from => "no-reply@peoplenetz.com"
  
  def new_assignment(user, topic_group)
    @user = user
    @topic_group = topic_group
    mail(:to => "#{user} <#{user.email}>", :subject => 'New Topic Assignment')
  end
  
  def iteration_start(user, topic_group)
    @user = user
    @topic_group = topic_group
    mail(:to => "#{user} <#{user.email}>", :subject => 'Next Iteration')
  end
  
  def new_account(user, password)
    @user = user
    @password = password
    mail(:to => "#{user} <#{user.email}>", :subject => 'New Account')
  end
  
  def iteration_close(manager, iteration_id)
    @manager = manager
    @topic_group = TopicGroup.find(Iteration.find(iteration_id).topic_group_id)
    mail(:to => "#{manager} <#{manager.email}>", :subject => 'Iteration Closed')
  end
end
