require 'rails_helper'

RSpec.describe SpotInfo, type: :model do
  describe "spotinfo" do
    context "to_s method" do
      it "get correct data" do
        spot = create(:spot)
        expect(spot.powersupply).to match(/利用不可/)
        expect(spot.powersupply).to match(/使用禁止/)
      end
      it "get latest data, not other" do
        spot = create(:spot)
        expect(spot.smoke).to match(/分煙/)
        expect(spot.smoke).to match(/喫煙所/)
        expect(spot.smoke).not_to match(/全席禁煙/)
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
