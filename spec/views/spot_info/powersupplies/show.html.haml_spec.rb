require 'rails_helper'

RSpec.describe "spot_info/powersupplies/show", type: :view do
  before(:each) do
    @spot_info_powersupply = assign(:spot_info_powersupply, SpotInfo::Powersupply.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
