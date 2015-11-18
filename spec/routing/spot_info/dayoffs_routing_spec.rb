require "rails_helper"

RSpec.describe SpotInfo::DayoffsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/spot_info/dayoffs").to route_to("spot_info/dayoffs#index")
    end

    it "routes to #new" do
      expect(:get => "/spot_info/dayoffs/new").to route_to("spot_info/dayoffs#new")
    end

    it "routes to #show" do
      expect(:get => "/spot_info/dayoffs/1").to route_to("spot_info/dayoffs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/spot_info/dayoffs/1/edit").to route_to("spot_info/dayoffs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/spot_info/dayoffs").to route_to("spot_info/dayoffs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/spot_info/dayoffs/1").to route_to("spot_info/dayoffs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/spot_info/dayoffs/1").to route_to("spot_info/dayoffs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/spot_info/dayoffs/1").to route_to("spot_info/dayoffs#destroy", :id => "1")
    end

  end
end
