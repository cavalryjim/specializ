require 'spec_helper'

describe "library_objectives/edit.html.erb" do
  before(:each) do
    @library_objective = assign(:library_objective, stub_model(LibraryObjective))
  end

  it "renders the edit library_objective form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => library_objectives_path(@library_objective), :method => "post" do
    end
  end
end
