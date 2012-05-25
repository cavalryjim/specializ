require 'spec_helper'

describe "library_objectives/new.html.erb" do
  before(:each) do
    assign(:library_objective, stub_model(LibraryObjective).as_new_record)
  end

  it "renders new library_objective form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => library_objectives_path, :method => "post" do
    end
  end
end
