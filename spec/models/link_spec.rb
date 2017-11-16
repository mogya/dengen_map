require 'rails_helper'

RSpec.describe Link, type: :model do
  xdescribe "links" do
    context "official link method" do
      it "normal case" do
        spot = Spot.new
        spot.links.build(url:'http://example.com/official', link_type:Link.link_types[:official])
        spot.links.build(url:'http://example.com/twitter', link_type:Link.link_types[:twitter])
        spot.links.build(url:'http://example.com/other', link_type:Link.link_types[:other])
        expect(spot.official_link.url).to eq 'http://example.com/official'

        spot = Spot.new
        spot.links.build(url:'http://example.com/twitter', link_type:Link.link_types[:twitter])
        spot.links.build(url:'http://example.com/other', link_type:Link.link_types[:other])
        spot.links.build(url:'http://example.com/official', link_type:Link.link_types[:official])
        expect(spot.official_link.url).to eq 'http://example.com/official'
      end
      it "without official" do
        spot = Spot.new
        spot.links.build(url:'http://example.com/other', link_type:Link.link_types[:other])
        spot.links.build(url:'http://example.com/twitter', link_type:Link.link_types[:twitter])
        expect(spot.official_link.url).to eq 'http://example.com/twitter'

        spot = Spot.new
        spot.links.build(url:'http://example.com/twitter', link_type:Link.link_types[:twitter])
        spot.links.build(url:'http://example.com/other', link_type:Link.link_types[:other])
        expect(spot.official_link.url).to eq 'http://example.com/twitter'
      end
      it "do not use other links" do
        spot = Spot.new
        spot.links.build(url:'http://example.com/other', link_type:Link.link_types[:other])
        expect(spot.official_link).to be_nil
      end
    end
  end
end
