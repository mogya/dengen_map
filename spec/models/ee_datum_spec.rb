require 'rails_helper'

RSpec.describe EeDatum, type: :model do
  describe "update_or_create_by_json" do
    let(:edit_date_num){ 20171105140347 }
    let(:edit_date){ Time.zone.parse(edit_date_num.to_s) }
    let(:entry){
      {
        "entry_id"=>81892,
        "tel"=>"042-668-8775",
        "edit_date"=>edit_date_num,
      }
    }
    context do
      subject { EeDatum.update_or_create_by_json(entry) }
      context '未登録の時' do
        it { expect {subject}.to change{ EeDatum.count }.by(1)}
      end
      context 'すでに登録済みの時' do
        before { create :ee_datum, spot_id: entry['entry_id'], ee_update_at: edit_date }
        it { expect {subject}.to change{ EeDatum.count }.by(0)}
      end
      context '古いデータがある時' do
        before { create :ee_datum, spot_id: entry['entry_id'], ee_update_at: edit_date-1.day, tel:'xxx' }
        it {
          expect {subject}.to change{ EeDatum.count }.by(0)
          expect(subject.tel).to eq entry['tel']
        }
      end
    end
  end
  describe "open?" do
    using RSpec::Parameterized::TableSyntax
    where(:status, :expiration_date, :result) do
       'open'   | 1.day.ago   | false
       'open'   | 1.day.since | true
       'open'   | nil         | true
       'closed' | 1.day.ago   | false
    end
    with_them do
      let(:ee_datum){ build :ee_datum, status: status, expiration_date: expiration_date }
      it { expect(ee_datum.open?).to be result }
    end
  end

  describe "update_spot" do
    context do
      let!(:categoryA){create :tag_category, name:'A',importance:1}
      let!(:categoryC){create :tag_category, name:'C',importance:4}
      let!(:categoryD){create :tag_category, name:'D',importance:3}
      let(:datum1){ create :ee_datum, category:'A,D', title:'カフェリンゴット', status:'open' }
      let(:datum2){ create :ee_datum, status:'closed' }
      it do
        datum1.update_spot
        datum2.update_spot
        expect(datum1.spot.name).to eq 'カフェリンゴット'
        expect(datum1.spot.tags).to include categoryA
        expect(datum1.spot.tags).to include categoryD
        expect(datum1.spot.tags).not_to include categoryC
        expect(datum1.spot.prime_category).to eq categoryD
        expect(datum1.spot.status).to eq 'status_open'
        expect(datum2.spot.status).to eq 'status_closed'
      end
    end
  end
end
