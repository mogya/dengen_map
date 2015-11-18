require 'rails_helper'

RSpec.describe "tag/wifis/index", type: :view do
  before(:each) do
    assign(:tag_wifis, [
      Tag::Wifi.create!(),
      Tag::Wifi.create!()
    ])
  end

  it "renders a list of tag/wifis" do
    render
  end
end
