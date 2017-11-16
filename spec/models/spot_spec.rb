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
      let!(:datum2){ create :ee_datum_with_spot, latitude:36.1, longitude:136.1, tag:'A,C' }
      let!(:datum3){ create :ee_datum_with_spot, latitude:37.1, longitude:137.1, tag:'B,C' }
      subject { Spot.spots_in_range(n:37, s:35, w:135, e:137, tags:['B']) }
      it do
        expect(subject).to include(datum1.spot)
        expect(subject).not_to include(datum2.spot)
        expect(subject).not_to include(datum3.spot)
      end
    end

    context "by categories" do
      let!(:datum1){ create :ee_datum_with_spot, latitude:36.0, longitude:136, category:'A,B' }
      let!(:datum2){ create :ee_datum_with_spot, latitude:36.1, longitude:136.1, category:'A' }
      let!(:datum3){ create :ee_datum_with_spot, latitude:37.1, longitude:137.1, category:'B' }
      subject { Spot.spots_in_range(n:37, s:35, w:135, e:137, categories:['B']) }
      it do
        expect(subject).to include(datum1.spot)
        expect(subject).not_to include(datum2.spot)
        expect(subject).not_to include(datum3.spot)
      end
    end
  end


end
