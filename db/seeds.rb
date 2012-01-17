# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

c = Company.create(:name => 'Pnetz_Test', :active => true)
g = Grouping.create(:name => c.name, :company_id => c.id)
u = User.create(:first_name => 'Admin', :last_name => 'User', :email => 'admin@peoplenetz.com',
      :active => true, :company_id => c.id, :password => '63hookem05?', :password_confirmation => '63hookem05?')
      
Role.create([{ :name => 'employee', :description => 'This is the basic role that all users have.' }, 
             { :name => 'manager', :description => 'This role is for users that will manage topics.' },
             { :name => 'hr', :description => 'This role is for users that will manage users.' },
             { :name => 'admin', :description => 'This role is for users that will manage the application.' },
             { :name => 'pnetz_admin', :description => 'This is a super user role for Peoplenetz.' }])
             
u.role_ids = [1,2,3,4,5]
u.grouping_ids = [g.id]

