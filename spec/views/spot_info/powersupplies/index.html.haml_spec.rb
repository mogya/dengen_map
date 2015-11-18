require 'rails_helper'

RSpec.describe "spot_info/powersupplies/index", type: :view do
  before(:each) do
    assign(:spot_info_powersupplies, [
      SpotInfo::Powersupply.create!(),
      SpotInfo::Powersupply.create!()
    ])
  end

  it "renders a list of spot_info/powersupplies" do
    render
  end
end
