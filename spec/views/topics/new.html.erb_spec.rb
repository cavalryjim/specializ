require 'spec_helper'

describe "topics/new.html.erb" do
  before(:each) do
    assign(:topic, stub_model(Topic,
      :name => "MyString",
      :description => "MyString",
      :status => 1,
      :update_frequency => 1,
      :due_days => 1,
      :opt_out => false,
      :company_id => 1
    ).as_new_record)
  end

  it "renders new topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => topics_path, :method => "post" do
      assert_select "input#topic_name", :name => "topic[name]"
      assert_select "input#topic_description", :name => "topic[description]"
      assert_select "input#topic_status", :name => "topic[status]"
      assert_select "input#topic_update_frequency", :name => "topic[update_frequency]"
      assert_select "input#topic_due_days", :name => "topic[due_days]"
      assert_select "input#topic_opt_out", :name => "topic[opt_out]"
      assert_select "input#topic_company_id", :name => "topic[company_id]"
    end
  end
end
