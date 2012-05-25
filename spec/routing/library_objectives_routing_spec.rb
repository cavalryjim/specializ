require "spec_helper"

describe LibraryObjectivesController do
  describe "routing" do

    it "routes to #index" do
      get("/library_objectives").should route_to("library_objectives#index")
    end

    it "routes to #new" do
      get("/library_objectives/new").should route_to("library_objectives#new")
    end

    it "routes to #show" do
      get("/library_objectives/1").should route_to("library_objectives#show", :id => "1")
    end

    it "routes to #edit" do
      get("/library_objectives/1/edit").should route_to("library_objectives#edit", :id => "1")
    end

    it "routes to #create" do
      post("/library_objectives").should route_to("library_objectives#create")
    end

    it "routes to #update" do
      put("/library_objectives/1").should route_to("library_objectives#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/library_objectives/1").should route_to("library_objectives#destroy", :id => "1")
    end

  end
end
