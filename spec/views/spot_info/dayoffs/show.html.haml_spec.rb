require 'rails_helper'

RSpec.describe "spot_info/dayoffs/show", type: :view do
  before(:each) do
    @spot_info_dayoff = assign(:spot_info_dayoff, SpotInfo::Dayoff.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
