require 'rails_helper'

RSpec.describe Spot, type: :model do
  describe "status" do
    context "normal case." do
      let(:spot) { build :spot }
      it "default status" do
        expect(spot.status_hidden?).to be true
      end
    end
  end

  describe "postgisable" do
    context do
      let(:spot) { build :spot, lonlat:'POINT(141.350857 43.067656)' }
      it "reader" do
        expect(spot.lat).to eq 43.067656
        expect(spot.lng).to eq 141.350857
        expect(spot.latlng_str).to eq "43.067656,141.350857"
      end
      it "writer" do
        spot.lat = 34.69806
        spot.lng = 135.50667
        expect(spot.lonlat.x).to eq 135.50667
        expect(spot.lonlat.y).to eq 34.69806
      end
    end
  end

end
