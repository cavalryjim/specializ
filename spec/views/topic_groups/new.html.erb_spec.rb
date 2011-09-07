require 'spec_helper'

describe "topic_groups/new.html.erb" do
  before(:each) do
    assign(:topic_group, stub_model(TopicGroup,
      :name => "MyString",
      :goal => 1,
      :active => false,
      :update_frequency => 1,
      :topic_id => 1,
      :grouping_id => 1
    ).as_new_record)
  end

  it "renders new topic_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => topic_groups_path, :method => "post" do
      assert_select "input#topic_group_name", :name => "topic_group[name]"
      assert_select "input#topic_group_goal", :name => "topic_group[goal]"
      assert_select "input#topic_group_active", :name => "topic_group[active]"
      assert_select "input#topic_group_update_frequency", :name => "topic_group[update_frequency]"
      assert_select "input#topic_group_topic_id", :name => "topic_group[topic_id]"
      assert_select "input#topic_group_grouping_id", :name => "topic_group[grouping_id]"
    end
  end
end
