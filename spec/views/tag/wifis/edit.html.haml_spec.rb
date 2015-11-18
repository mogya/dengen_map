require 'rails_helper'

RSpec.describe "tag/wifis/edit", type: :view do
  before(:each) do
    @tag_wifi = assign(:tag_wifi, Tag::Wifi.create!())
  end

  it "renders the edit tag_wifi form" do
    render

    assert_select "form[action=?][method=?]", tag_wifi_path(@tag_wifi), "post" do
    end
  end
end
