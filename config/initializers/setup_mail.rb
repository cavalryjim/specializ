ActionMailer::Base.smtp_settings = {
  :address              => "smtp.mailgun.org",
  :port                 => 587,
  :domain               => "app929801.mailgun.org",
  :user_name            => "postmaster@app929801.mailgun.org",
  :password             => "3fgmqzubwtd9",
  :authentication       => :plain,
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:protocol] = "https"
ActionMailer::Base.default_url_options[:host] = "www.specializ.us"
#ActionMailer::Base.default_url_options[:host] = "localhost:3000"
#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?

#JDavis: the following two lines of code are used to intercept system generated emails. See lib/development_mail_interceptor.rb 
#require 'development_mail_interceptor'
#ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?