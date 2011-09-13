require "spec_helper"

describe IterationsController do
  describe "routing" do

    it "routes to #index" do
      get("/iterations").should route_to("iterations#index")
    end

    it "routes to #new" do
      get("/iterations/new").should route_to("iterations#new")
    end

    it "routes to #show" do
      get("/iterations/1").should route_to("iterations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/iterations/1/edit").should route_to("iterations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/iterations").should route_to("iterations#create")
    end

    it "routes to #update" do
      put("/iterations/1").should route_to("iterations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/iterations/1").should route_to("iterations#destroy", :id => "1")
    end

  end
end
