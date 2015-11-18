require 'rails_helper'

RSpec.describe "spot_info/business_hours/show", type: :view do
  before(:each) do
    @spot_info_business_hour = assign(:spot_info_business_hour, SpotInfo::BusinessHour.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
