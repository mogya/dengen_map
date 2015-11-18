require "rails_helper"

RSpec.describe Tag::OthersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tag/others").to route_to("tag/others#index")
    end

    it "routes to #new" do
      expect(:get => "/tag/others/new").to route_to("tag/others#new")
    end

    it "routes to #show" do
      expect(:get => "/tag/others/1").to route_to("tag/others#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tag/others/1/edit").to route_to("tag/others#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tag/others").to route_to("tag/others#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tag/others/1").to route_to("tag/others#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tag/others/1").to route_to("tag/others#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tag/others/1").to route_to("tag/others#destroy", :id => "1")
    end

  end
end
