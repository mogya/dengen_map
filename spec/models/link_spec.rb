require 'rails_helper'

RSpec.describe Link, type: :model do
  describe "official link method" do
    let(:spot){ build :spot, links:links }
    let(:link_twitter){ build :link, url:'http://twitter.com/hoge', link_type:Link.link_types[:twitter]}
    let(:link_facebook){ build :link, url:'http://facebook.com/hoge', link_type:Link.link_types[:facebook]}
    let(:link_official){ build :link, url:'http://example.com', link_type:Link.link_types[:official]}
    let(:link_other){ build :link, url:'http://example.com/other', link_type:Link.link_types[:other]}
    subject{ spot.official_link.url }
    context "normal case" do
      let(:links){[
        link_twitter,
        link_other,
        link_official
      ]}
      it { is_expected.to eq link_official.url }
    end
    context "without official" do
      let(:links){[
        link_twitter,
        link_other
      ]}
      it { is_expected.to eq link_twitter.url}
    end
    context "do not use other links" do
      let(:links){[
        link_other
      ]}
      it { is_expected.to be_nil }
    end
  end
  describe "set_link_type method" do
    context do
      using RSpec::Parameterized::TableSyntax
      where(:url, :expected_link_type) do
        'https://twitter.com/mogya' | :twitter
        'https://www.facebook.com/suumo.jp/' | :facebook
        'https://facebook.com/suumo.jp/' | :facebook
        'https://www.instagram.com/darvishsefat11/' | :instagram
        'https://example.com/mogya' | :other
        nil | :other
      end
      with_them do
        subject{ Link.new(url:url) } # factory_girlだとafter_initializeが効かない？
        let(:link){ build :link, url:url }
        it do
          expect(subject.link_type).to eq expected_link_type.to_s
        end
      end
    end
  end
end
