require 'rails_helper'

RSpec.describe Spot, type: :model do
  describe "status" do
    context "normal case." do
      it "default status" do
        spot = Spot.new
        expect(spot.hidden?).to be true
      end
    end
  end

  describe "latlng" do
    context "latitude/longitude methods" do
      it "reader" do
        spot = Spot.new
        spot.lat = 3469806
        spot.lng = 13550667
        expect(spot.latitude).to eq 34.69806
        expect(spot.longitude).to eq 135.50667
        expect(spot.latlng_str).to eq '34.69806,135.50667'
      end
      it "writer" do
        spot = Spot.new
        spot.latitude = 34.69806
        spot.longitude = 135.50667
        expect(spot.lat).to eq 3469806
        expect(spot.lng).to eq 13550667
        expect(spot.latlng_str).to eq '34.69806,135.50667'
      end
    end
  end
end
