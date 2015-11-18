require "rails_helper"

RSpec.describe SpotInfo::SmokesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/spot_info/smokes").to route_to("spot_info/smokes#index")
    end

    it "routes to #new" do
      expect(:get => "/spot_info/smokes/new").to route_to("spot_info/smokes#new")
    end

    it "routes to #show" do
      expect(:get => "/spot_info/smokes/1").to route_to("spot_info/smokes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/spot_info/smokes/1/edit").to route_to("spot_info/smokes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/spot_info/smokes").to route_to("spot_info/smokes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/spot_info/smokes/1").to route_to("spot_info/smokes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/spot_info/smokes/1").to route_to("spot_info/smokes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/spot_info/smokes/1").to route_to("spot_info/smokes#destroy", :id => "1")
    end

  end
end
