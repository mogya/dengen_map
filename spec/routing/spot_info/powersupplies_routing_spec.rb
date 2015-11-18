require "rails_helper"

RSpec.describe SpotInfo::PowersuppliesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/spot_info/powersupplies").to route_to("spot_info/powersupplies#index")
    end

    it "routes to #new" do
      expect(:get => "/spot_info/powersupplies/new").to route_to("spot_info/powersupplies#new")
    end

    it "routes to #show" do
      expect(:get => "/spot_info/powersupplies/1").to route_to("spot_info/powersupplies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/spot_info/powersupplies/1/edit").to route_to("spot_info/powersupplies#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/spot_info/powersupplies").to route_to("spot_info/powersupplies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/spot_info/powersupplies/1").to route_to("spot_info/powersupplies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/spot_info/powersupplies/1").to route_to("spot_info/powersupplies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/spot_info/powersupplies/1").to route_to("spot_info/powersupplies#destroy", :id => "1")
    end

  end
end
