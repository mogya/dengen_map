# coding: utf-8
require 'rails_helper'

RSpec.describe Tag, type: :model do
  xdescribe "tagable" do
    context "spot.category method" do
      let!(:category1){ create :tag_category, name:'喫茶店', importance:0 }
      let!(:category2){ create :tag_category, name:'コワーキングスペース', importance: 2 }
      let!(:category3){ create :tag_category, name:'ワクドナルド' }
      let(:spot){ create :spot, tags:[ category1, category2 ] }
      it "categoryが取得できること" do
        expect(spot.category).to match(/喫茶店/)
        expect(spot.category).to match(/コワーキングスペース/)
        expect(spot.category).not_to match(/ワクドナルド/)
      end
      it "importanceの大きい物が前に並ぶこと" do
        category = spot.category
        expect( category.index('喫茶店') ).to be > category.index('コワーキングスペース')
      end
    end
  end

end
