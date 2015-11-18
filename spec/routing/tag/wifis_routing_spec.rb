require "rails_helper"

RSpec.describe Tag::WifisController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tag/wifis").to route_to("tag/wifis#index")
    end

    it "routes to #new" do
      expect(:get => "/tag/wifis/new").to route_to("tag/wifis#new")
    end

    it "routes to #show" do
      expect(:get => "/tag/wifis/1").to route_to("tag/wifis#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tag/wifis/1/edit").to route_to("tag/wifis#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tag/wifis").to route_to("tag/wifis#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tag/wifis/1").to route_to("tag/wifis#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tag/wifis/1").to route_to("tag/wifis#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tag/wifis/1").to route_to("tag/wifis#destroy", :id => "1")
    end

  end
end
