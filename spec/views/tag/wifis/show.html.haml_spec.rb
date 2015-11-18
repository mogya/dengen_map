require 'rails_helper'

RSpec.describe "tag/wifis/show", type: :view do
  before(:each) do
    @tag_wifi = assign(:tag_wifi, Tag::Wifi.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
