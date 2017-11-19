# coding: utf-8
require 'rails_helper'

RSpec.describe Tag::Category, type: :model do
  describe "primary_category" do
    context do
      let!(:categoryA){create :tag_category, name:'A',importance:1, image:'a.png'}
      let!(:categoryB){create :tag_category, name:'B',importance:2, image:'b.png'}
      let!(:categoryC){create :tag_category, name:'C',importance:4, image: nil }
      let!(:categoryD){create :tag_category, name:'D',importance:3, image:'d.png'}
      it do
        expect(Tag::Category.prime_category([])).to eq nil
        expect(Tag::Category.prime_category(%w(B))).to eq categoryB
        expect(Tag::Category.prime_category(%w(A B D))).to eq categoryD
        expect(Tag::Category.prime_category(%w(A B C D))).to eq categoryC
        expect(Tag::Category.prime_category(%w(A B C D), with_image:true)).to eq categoryD
      end
    end
  end
end
