require 'rails_helper'

RSpec.describe "spot_info/smokes/show", type: :view do
  before(:each) do
    @spot_info_smoke = assign(:spot_info_smoke, SpotInfo::Smoke.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
