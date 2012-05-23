require 'spec_helper'

describe "libraries/edit.html.erb" do
  before(:each) do
    @library = assign(:library, stub_model(Library))
  end

  it "renders the edit library form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => libraries_path(@library), :method => "post" do
    end
  end
end
