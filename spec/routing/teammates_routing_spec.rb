require "spec_helper"

describe TeammatesController do
  describe "routing" do

    it "routes to #index" do
      get("/teammates").should route_to("teammates#index")
    end

    it "routes to #new" do
      get("/teammates/new").should route_to("teammates#new")
    end

    it "routes to #show" do
      get("/teammates/1").should route_to("teammates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/teammates/1/edit").should route_to("teammates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/teammates").should route_to("teammates#create")
    end

    it "routes to #update" do
      put("/teammates/1").should route_to("teammates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/teammates/1").should route_to("teammates#destroy", :id => "1")
    end

  end
end
