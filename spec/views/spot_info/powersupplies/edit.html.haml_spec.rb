require 'rails_helper'

RSpec.describe "spot_info/powersupplies/edit", type: :view do
  before(:each) do
    @spot_info_powersupply = assign(:spot_info_powersupply, SpotInfo::Powersupply.create!())
  end

  it "renders the edit spot_info_powersupply form" do
    render

    assert_select "form[action=?][method=?]", spot_info_powersupply_path(@spot_info_powersupply), "post" do
    end
  end
end
