require 'spec_helper'

describe "topic_groups/index.html.erb" do
  before(:each) do
    assign(:topic_groups, [
      stub_model(TopicGroup,
        :name => "Name",
        :goal => 1,
        :active => false,
        :update_frequency => 1,
        :topic_id => 1,
        :grouping_id => 1
      ),
      stub_model(TopicGroup,
        :name => "Name",
        :goal => 1,
        :active => false,
        :update_frequency => 1,
        :topic_id => 1,
        :grouping_id => 1
      )
    ])
  end

  it "renders a list of topic_groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
