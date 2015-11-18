require 'rails_helper'

RSpec.describe "spot_info/dayoffs/edit", type: :view do
  before(:each) do
    @spot_info_dayoff = assign(:spot_info_dayoff, SpotInfo::Dayoff.create!())
  end

  it "renders the edit spot_info_dayoff form" do
    render

    assert_select "form[action=?][method=?]", spot_info_dayoff_path(@spot_info_dayoff), "post" do
    end
  end
end
