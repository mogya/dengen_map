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

  describe "add_tags" do
    context do
      let!(:spot) { create :spot }
      let!(:tagA){create :tag_category, name:'A',importance:1}
      let!(:tagB){create :tag_other, name:'B',importance:2}
      let!(:tagD){create :tag_wifi, name:'D',importance:4}
      let!(:tagC){create :tag_category, name:'C',importance:3}
      it {
        spot.add_tags('A,B,D')
        expect(spot.tags).to include tagA
        expect(spot.tags).to include tagB
        expect(spot.tags).to include tagD
        expect(spot.tags).not_to include tagC
        expect(spot.category_tags).to include tagA
        expect(spot.category_tags).not_to include tagB
        expect(spot.category_tags).not_to include tagC
        expect(spot.wireless_tags).to include tagD
        expect(spot.wireless_tags).not_to include tagA
        expect(spot.other_tags).to include tagB
        expect(spot.other_tags).not_to include tagA
      }
    end
  end

  describe "icon" do
    context do
      let!(:categoryA){create :tag_category, name:'A',image:'spot_icon_05_[type]_[size]px.png'}
      let(:datum1){ create :ee_datum_with_spot, category:'A', tag:'電源:お客様用コンセント' }
      let(:datum2){ create :ee_datum_with_spot, category:'A', tag:'電源:NG' }
      it { expect(datum1.spot.icon).to eq '//oasis.mogya.com/images/design/spot_icon_05_none_[size]px.png' }
      it { expect(datum2.spot.icon).to eq '//oasis.mogya.com/images/design/spot_icon_05_none_[size]px.png' }
    end
  end

  describe "spots_in_range" do
    context "by nwse" do
      let!(:datum1){ create :ee_datum_with_spot, latitude:36.0, longitude:136 }
      let!(:datum2){ create :ee_datum_with_spot, latitude:36.1, longitude:136.1 }
      let!(:datum3){ create :ee_datum_with_spot, latitude:37.1, longitude:137.1 }
      let!(:datum4){ create :ee_datum_with_spot, latitude:36.0, longitude:136, status:'closed' }
      subject { Spot.spots_in_range(n:37, s:35, w:135, e:137) }
      it 'getting spot list' do
        expect(subject.first).to eq datum1.spot
        expect(subject.second).to eq datum2.spot
        expect(subject).not_to include(datum3.spot)
        expect(subject).not_to include(datum4.spot)
      end
      it 'getting distance' do
        expect(subject.first.distance).to be_kind_of(Float)
        expect(subject.second.distance).to be >= subject.first.distance
      end
    end

    context "by contains_invalid" do
      let!(:datum1){ create :ee_datum_with_spot, latitude:36.0, longitude:136 }
      let!(:datum2){ create :ee_datum_with_spot, latitude:36.1, longitude:136.1 }
      let!(:datum3){ create :ee_datum_with_spot, latitude:37.1, longitude:137.1 }
      let!(:datum4){ create :ee_datum_with_spot, latitude:36.0, longitude:136, status:'closed' }
      subject { Spot.spots_in_range(n:37, s:35, w:135, e:137, contains_invalid:true) }
      it do
        expect(subject).to include(datum1.spot)
        expect(subject).to include(datum2.spot)
        expect(subject).not_to include(datum3.spot)
        expect(subject).to include(datum4.spot)
      end
    end

    context "by tag" do
      let!(:datum1){ create :ee_datum_with_spot, latitude:36.0, longitude:136, tag:'A,B,C' }
      let!(:datum2){ create :ee_datum_with_spot, latitude:36.0, longitude:136, tag:'A,C' }
      let!(:datum3){ create :ee_datum_with_spot, latitude:36.0, longitude:136, tag:'B,C' }
      let!(:datum4){ create :ee_datum_with_spot, latitude:36.0, longitude:136, tag:'C,D' }
      subject { Spot.spots_in_range(n:37, s:35, w:135, e:137, tags:['A','B']) }
      it do
        expect(subject).to include(datum2.spot)
        expect(subject).to include(datum3.spot)
        expect(subject).not_to include(datum4.spot)
      end
    end

    context "by categories" do
      let!(:categoryA){create :tag_category, name:'A',importance:1}
      let!(:categoryB){create :tag_category, name:'B',importance:2}
      let!(:categoryC){create :tag_category, name:'C',importance:4}
      let!(:categoryD){create :tag_category, name:'D',importance:3}
      let!(:datum1){ create :ee_datum_with_spot, latitude:36.0, longitude:136, category:'A,B,C' }
      let!(:datum2){ create :ee_datum_with_spot, latitude:36.0, longitude:136, category:'A,C' }
      let!(:datum3){ create :ee_datum_with_spot, latitude:36.0, longitude:136, category:'B,C' }
      let!(:datum4){ create :ee_datum_with_spot, latitude:36.0, longitude:136, category:'C,D' }
      subject { Spot.spots_in_range(n:37, s:35, w:135, e:137, categories:['A','B']) }
      it do
        expect(subject).to include(datum3.spot)
        expect(subject).not_to include(datum4.spot)
      end
    end
  end


end
