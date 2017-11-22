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

  describe "categories" do
    context do
      let!(:datum1){ create :ee_datum_with_spot, category:'A,B , C ,D' }
      subject { datum1.spot.categories }
      it { is_expected.to eq ['A','B','C','D'] }
    end
  end

  describe "prime_category" do
    context do
      let!(:categoryA){create :tag_category, name:'A',importance:1}
      let!(:categoryB){create :tag_category, name:'B',importance:2}
      let!(:categoryC){create :tag_category, name:'C',importance:4}
      let!(:categoryD){create :tag_category, name:'D',importance:3}
      let(:datum0){ create :ee_datum_with_spot, category:nil }
      let(:datum1){ create :ee_datum_with_spot, category:'B' }
      let(:datum2){ create :ee_datum_with_spot, category:'A,D' }
      let(:datum3){ create :ee_datum_with_spot, category:'A,C,D' }
      it do
       expect(datum0.spot.prime_category).to eq nil
       expect(datum1.spot.prime_category).to eq categoryB
       expect(datum2.spot.prime_category).to eq categoryD
       expect(datum3.spot.prime_category).to eq categoryC
     end
    end
  end

  describe "icon" do
    context do
      let!(:categoryA){create :tag_category, name:'A',image:'spot_icon_05_[type]_[size]px.png'}
      let(:datum1){ create :ee_datum_with_spot, category:'A', tag:'電源:お客様用コンセント' }
      let(:datum2){ create :ee_datum_with_spot, category:'A', tag:'電源:NG' }
      it { expect(datum1.spot.icon).to eq '//oasis.mogya.com/images/design/spot_icon_05_none_[size]px.png' }
      it { expect(datum1.spot.powerframe_icon).to eq '//oasis.mogya.com/images/design/spot_icon_05_ok_[size]px.png' }
      it { expect(datum2.spot.icon).to eq '//oasis.mogya.com/images/design/spot_icon_05_none_[size]px.png' }
      it { expect(datum2.spot.powerframe_icon).to eq '//oasis.mogya.com/images/design/spot_icon_05_ng_[size]px.png' }
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
        # expect(subject).to include(datum1.spot)
        expect(subject).to include(datum2.spot)
        expect(subject).to include(datum3.spot)
        expect(subject).not_to include(datum4.spot)
      end
    end

    context "by categories" do
      let!(:datum1){ create :ee_datum_with_spot, latitude:36.0, longitude:136, category:'A,B,C' }
      let!(:datum2){ create :ee_datum_with_spot, latitude:36.0, longitude:136, category:'A,C' }
      let!(:datum3){ create :ee_datum_with_spot, latitude:36.0, longitude:136, category:'B,C' }
      let!(:datum4){ create :ee_datum_with_spot, latitude:36.0, longitude:136, category:'C,D' }
      subject { Spot.spots_in_range(n:37, s:35, w:135, e:137, categories:['A','B']) }
      it do
        # expect(subject).to include(datum1.spot)
        # expect(subject).to include(datum2.spot)
        expect(subject).to include(datum3.spot)
        expect(subject).not_to include(datum4.spot)
      end
    end
  end


end
