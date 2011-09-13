require 'spec_helper'

describe "elements/edit.html.erb" do
  before(:each) do
    @element = assign(:element, stub_model(Element,
      :name => "MyString",
      :current => false,
      :created_by => 1,
      :edited_by => 1
    ))
  end

  it "renders the edit element form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => elements_path(@element), :method => "post" do
      assert_select "input#element_name", :name => "element[name]"
      assert_select "input#element_current", :name => "element[current]"
      assert_select "input#element_created_by", :name => "element[created_by]"
      assert_select "input#element_edited_by", :name => "element[edited_by]"
    end
  end
end
