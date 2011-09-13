require 'spec_helper'

describe "iterations/index.html.erb" do
  before(:each) do
    assign(:iterations, [
      stub_model(Iteration,
        :num => 1,
        :consensus => 1.5,
        :active => false,
        :topic_group_id => 1
      ),
      stub_model(Iteration,
        :num => 1,
        :consensus => 1.5,
        :active => false,
        :topic_group_id => 1
      )
    ])
  end

  it "renders a list of iterations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
