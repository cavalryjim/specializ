require 'spec_helper'

describe "assignments/show.html.erb" do
  before(:each) do
    @assignment = assign(:assignment, stub_model(Assignment,
      :user_id => 1,
      :topic_group_id => 1,
      :manager => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
