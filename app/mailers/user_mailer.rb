class UserMailer < ActionMailer::Base
  default :from => "no-reply@peoplenetz.com"
  
  def new_assignment(user, topic_group)
    @user = user
    @topic_group = topic_group
    mail(:to => "#{user.name} <#{user.email}>", :subject => 'New Topic Assignment')
  end
  
  def iteration_start(user, topic_group)
    @user = user
    @topic_group = topic_group
    mail(:to => "#{user.name} <#{user.email}>", :subject => 'Next Iteration')
  end
  
  def new_account(user, generated_password)
    @user = user
    @password = generated_password
    mail(:to => "#{user.name} <#{user.email}>", :subject => 'New Account')
  end
end
