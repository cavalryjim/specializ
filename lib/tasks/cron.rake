desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  #if Time.now.hour % 4 == 0 # run every four hours
  #  puts "Updating feed..."
  #  NewsFeed.update
  #  puts "done."
  #end

  if Time.now.hour == 0 # run at midnight
    #User.send_reminders
    puts "Checking for Topics to restart."
    Topic.check_for_restart
    puts "Done with Topics."
  end
end