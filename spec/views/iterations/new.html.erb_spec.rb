require 'spec_helper'

describe "iterations/new.html.erb" do
  before(:each) do
    assign(:iteration, stub_model(Iteration,
      :num => 1,
      :consensus => 1.5,
      :active => false,
      :topic_group_id => 1
    ).as_new_record)
  end

  it "renders new iteration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => iterations_path, :method => "post" do
      assert_select "input#iteration_num", :name => "iteration[num]"
      assert_select "input#iteration_consensus", :name => "iteration[consensus]"
      assert_select "input#iteration_active", :name => "iteration[active]"
      assert_select "input#iteration_topic_group_id", :name => "iteration[topic_group_id]"
    end
  end
end
