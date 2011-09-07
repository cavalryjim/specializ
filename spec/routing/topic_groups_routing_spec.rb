require "spec_helper"

describe TopicGroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/topic_groups").should route_to("topic_groups#index")
    end

    it "routes to #new" do
      get("/topic_groups/new").should route_to("topic_groups#new")
    end

    it "routes to #show" do
      get("/topic_groups/1").should route_to("topic_groups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/topic_groups/1/edit").should route_to("topic_groups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/topic_groups").should route_to("topic_groups#create")
    end

    it "routes to #update" do
      put("/topic_groups/1").should route_to("topic_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/topic_groups/1").should route_to("topic_groups#destroy", :id => "1")
    end

  end
end
