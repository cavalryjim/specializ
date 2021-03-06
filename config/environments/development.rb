Specializ::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false
  
  # JDavis: adding the following line for devise & active admin
  #config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  #config.action_mailer.default_url_options = { :host => 'specializ.heroku.com' }
  #config.action_mailer.default_url_options = { :protocol => 'https', :host => 'www.specializ.us' }

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin
  
  config.after_initialize do
    Bullet.enable = false # JDavis: to use, change to true
    #Bullet.alert = false
    #Bullet.bullet_logger = true
    #Bullet.console = true
    #Bullet.growl = true
    #Bullet.xmpp = { :account => 'bullets_account@jabber.org',
    #                :password => 'bullets_password_for_jabber',
    #                :receiver => 'your_account@jabber.org',
    #                :show_online_status => true }
    #Bullet.rails_logger = true
    #Bullet.disable_browser_cache = true
  end
  
  # JDavis: enabling ssl
  #config.middleware.insert_before ActionDispatch::Static, "Rack::SSL"
  config.middleware.insert_before ActionDispatch::Static, Rack::SSL, :exclude => proc { |env| env['HTTPS'] != 'on' }
  
  # JDavis: this is for a heroku addon that handles backgroup processes.  Heroku takes care of the production environment.
  #ENV['IRON_WORKER_TOKEN'] = 'dngc_0NZBP4GBqkVH2kiFgefkO4'
  #ENV['IRON_WORKER_PROJECT_ID'] = '4f6b6490f6a48e5c14004825'

  
end

