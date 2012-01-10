class AddInitialCompanyAndUser < ActiveRecord::Migration
  def self.up
    c = Company.create!(:name => 'Pnetz_Test', :active => true)
    g = Grouping.create!(:name => c.name, :company_id => c.id)
    u = User.create!(:first_name => 'Admin', :last_name => 'User', :email => 'admin@peoplenetz.com',
      :active => true, :company_id => c.id, :password => '63hookem05?', :password_confirmation => '63hookem05?')
    u.role_ids = [1,2,3,4,5]
    u.grouping_ids = [g.id]
  end

  def self.down
    User.find_by_email('admin@peoplenetz.com').destroy
    Grouping.find_by_name('Pnetz_Test').destroy
    Company.find_by_name('Pnetz_Test').destroy
  end
end
