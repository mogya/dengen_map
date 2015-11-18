require 'rails_helper'

RSpec.describe "spot_info/powersupplies/new", type: :view do
  before(:each) do
    assign(:spot_info_powersupply, SpotInfo::Powersupply.new())
  end

  it "renders new spot_info_powersupply form" do
    render

    assert_select "form[action=?][method=?]", spot_info_powersupplies_path, "post" do
    end
  end
end
