require 'spec_helper'

describe "library_objectives/show.html.erb" do
  before(:each) do
    @library_objective = assign(:library_objective, stub_model(LibraryObjective))
  end

  it "renders attributes in <p>" do
    render
  end
end
