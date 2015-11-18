require "rails_helper"

RSpec.describe SpotInfo::BusinessHoursController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/spot_info/business_hours").to route_to("spot_info/business_hours#index")
    end

    it "routes to #new" do
      expect(:get => "/spot_info/business_hours/new").to route_to("spot_info/business_hours#new")
    end

    it "routes to #show" do
      expect(:get => "/spot_info/business_hours/1").to route_to("spot_info/business_hours#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/spot_info/business_hours/1/edit").to route_to("spot_info/business_hours#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/spot_info/business_hours").to route_to("spot_info/business_hours#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/spot_info/business_hours/1").to route_to("spot_info/business_hours#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/spot_info/business_hours/1").to route_to("spot_info/business_hours#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/spot_info/business_hours/1").to route_to("spot_info/business_hours#destroy", :id => "1")
    end

  end
end
