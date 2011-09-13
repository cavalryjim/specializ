require 'spec_helper'

describe "elements/index.html.erb" do
  before(:each) do
    assign(:elements, [
      stub_model(Element,
        :name => "Name",
        :current => false,
        :created_by => 1,
        :edited_by => 1
      ),
      stub_model(Element,
        :name => "Name",
        :current => false,
        :created_by => 1,
        :edited_by => 1
      )
    ])
  end

  it "renders a list of elements" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
