require 'spec_helper'

describe "LibraryObjectives" do
  describe "GET /library_objectives" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get library_objectives_path
      response.status.should be(200)
    end
  end
end
