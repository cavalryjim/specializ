class AddInitialTestData < ActiveRecord::Migration
  def self.up
    Company.create!(:name => 'Test Company', :active => true)
    User.create!(:first_name => 'Johnny', :last_name => 'Test', :email => 'jtest@test.com', :active => true, :company_id => Company.last.id)
    Grouping.create!(:name => 'Test Group', :company_id => Company.last.id)
    Topic.create!(:name => 'Test Topic', :description => 'This is a test topic', :company_id => Company.last.id)
    TopicGroup.create!(:name => 'Test Topic: Test Group', :goal => 80, :active => true, :topic_id => Topic.last.id, :grouping_id => Grouping.last.id)
    Assignment.create!(:user_id => User.last.id, :topic_group_id => TopicGroup.last.id, :manager => false, :participating => true)
    Iteration.create!(:num => 1, :active => true, :topic_group_id => TopicGroup.last.id)
  end

  def self.down
    Topic.find_by_name('Test Topic').destroy
    Grouping.find_by_name('Test Group').destroy
    User.find_by_email('jtest@test.com').destroy
    Company.find_by_name('Test Company').destroy
  end
end
