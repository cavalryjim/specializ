require 'spec_helper'

describe "assignments/edit.html.erb" do
  before(:each) do
    @assignment = assign(:assignment, stub_model(Assignment,
      :user_id => 1,
      :topic_group_id => 1,
      :manager => false
    ))
  end

  it "renders the edit assignment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => assignments_path(@assignment), :method => "post" do
      assert_select "input#assignment_user_id", :name => "assignment[user_id]"
      assert_select "input#assignment_topic_group_id", :name => "assignment[topic_group_id]"
      assert_select "input#assignment_manager", :name => "assignment[manager]"
    end
  end
end
