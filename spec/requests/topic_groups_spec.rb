require 'spec_helper'

describe "TopicGroups" do
  describe "GET /topic_groups" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get topic_groups_path
      response.status.should be(200)
    end
  end
end
