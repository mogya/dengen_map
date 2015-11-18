require 'rails_helper'

RSpec.describe "tag/wifis/new", type: :view do
  before(:each) do
    assign(:tag_wifi, Tag::Wifi.new())
  end

  it "renders new tag_wifi form" do
    render

    assert_select "form[action=?][method=?]", tag_wifis_path, "post" do
    end
  end
end
