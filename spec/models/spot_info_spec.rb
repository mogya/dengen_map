require 'rails_helper'

RSpec.describe SpotInfo, type: :model do
  describe "spotinfo" do
    context "spot_info shorthands" do
      let(:spot_info_smoke){ create(:spot_info_smoke) }
      let(:spot_info_powersupply){ create(:spot_info_powersupply) }
      let(:spot_info_business_hour) { create(:spot_info_business_hour) }
      let(:spot_info_dayoff) { create(:spot_info_dayoff) }
      let(:spot){
        create(
          :spot, spot_infos:[
            spot_info_smoke,
            spot_info_powersupply,
            spot_info_business_hour,
            spot_info_dayoff
          ]
        )
      }
      it '指定したクラスの情報だけが取得できる' do
        expect(spot.smoke_infos).to     include spot_info_smoke
        expect(spot.smoke_infos).not_to include spot_info_powersupply

        expect(spot.powersupply_infos).to include spot_info_powersupply
        expect(spot.powersupply_infos).not_to include spot_info_smoke

        expect(spot.business_hour_infos).to     include spot_info_business_hour
        expect(spot.business_hour_infos).not_to include spot_info_dayoff

        expect(spot.dayoff_infos).to     include spot_info_dayoff
        expect(spot.dayoff_infos).not_to include spot_info_business_hour
      end
    end

    context "to_s methods" do
      let(:time_1){ Time.zone.local(2011, 11, 11, 11, 11, 15)  }
      let(:time_2){ Time.zone.local(2012, 11, 11, 11, 11, 15)  }
      let(:spot_info_powersupply1){ create(:spot_info_powersupply, created_at: time_1, value:'ng', detail:'ダメ')}
      let(:spot_info_powersupply2){ create(:spot_info_powersupply, created_at: time_2, value:'ok', detail:'大丈夫')}
      let(:spot){
        create(
          :spot, spot_infos:[
            spot_info_powersupply1,
            spot_info_powersupply2
          ]
        )
      }
      it '最後に更新された情報だけがto_sに反映される' do
        expect(spot.powersupply).to     include '大丈夫'
        expect(spot.powersupply).not_to include 'ダメ'
      end
    end
  end
end
