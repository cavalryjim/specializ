require 'spec_helper'

describe "library_objectives/index.html.erb" do
  before(:each) do
    assign(:library_objectives, [
      stub_model(LibraryObjective),
      stub_model(LibraryObjective)
    ])
  end

  it "renders a list of library_objectives" do
    render
  end
end
