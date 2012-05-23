require 'spec_helper'

describe "libraries/show.html.erb" do
  before(:each) do
    @library = assign(:library, stub_model(Library))
  end

  it "renders attributes in <p>" do
    render
  end
end
