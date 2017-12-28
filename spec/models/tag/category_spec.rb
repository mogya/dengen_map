# coding: utf-8
require 'rails_helper'

RSpec.describe Tag::Category, type: :model do
  describe "primary_category" do
    context do
      let!(:categoryA){create :tag_category, name:'A',importance:1, image:'a.png'}
      let!(:categoryB){create :tag_category, name:'B',importance:2, image:'b.png'}
      let!(:categoryC){create :tag_category, name:'C',importance:4, image: nil }
      let!(:categoryD){create :tag_category, name:'D',importance:3, image:'d.png'}
      let!(:categoryOther){create :tag_category, name:'その他',importance:1}
      it do
        expect(Tag::Category.prime_category([categoryA])).to eq categoryA
        expect(Tag::Category.prime_category([categoryA,categoryB])).to eq categoryB
        expect(Tag::Category.prime_category([categoryA,categoryB,categoryC,categoryD])).to eq categoryD
        expect(Tag::Category.prime_category([])).to eq categoryOther
      end
    end
  end
end
