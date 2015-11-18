require 'rails_helper'

RSpec.describe "spot_info/dayoffs/new", type: :view do
  before(:each) do
    assign(:spot_info_dayoff, SpotInfo::Dayoff.new())
  end

  it "renders new spot_info_dayoff form" do
    render

    assert_select "form[action=?][method=?]", spot_info_dayoffs_path, "post" do
    end
  end
end
