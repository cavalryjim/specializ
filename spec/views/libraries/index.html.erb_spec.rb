require 'spec_helper'

describe "libraries/index.html.erb" do
  before(:each) do
    assign(:libraries, [
      stub_model(Library),
      stub_model(Library)
    ])
  end

  it "renders a list of libraries" do
    render
  end
end
