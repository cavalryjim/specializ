require 'spec_helper'

describe "iterations/show.html.erb" do
  before(:each) do
    @iteration = assign(:iteration, stub_model(Iteration,
      :num => 1,
      :consensus => 1.5,
      :active => false,
      :topic_group_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
