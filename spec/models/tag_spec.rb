require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "Tag::Category" do
    context "spot.category method" do
      it "categoryが取得できること" do
        spot = create(:spot)
        expect(spot.category).to match(/その他/)
        expect(spot.category).to match(/コワーキングスペース/)
      end
      it "importanceの大きい物が前に並ぶこと" do
        spot = create(:spot)
        category = spot.category
        category_pos1 = category.index('その他')
        category_pos2 = category.index('コワーキングスペース')
        expect(category_pos1).to be > category_pos2
      end
    end
  end
  describe "Tag::Wifi" do
    context "spot.wifi method" do
      it "wifiが取得できること" do
        spot = create(:spot)
        expect(spot.wifi).to match(/AU Wifi/)
        expect(spot.wifi).to match(/SoftbankWifi/)
      end
    end
  end
  describe "Tag::Other" do
    context "spot.other method" do
      it "otherが取得できること" do
        spot = create(:spot)
        expect(spot.other).to match(/イートインスペース/)
      end
    end
  end
end
