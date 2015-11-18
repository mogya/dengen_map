require 'rails_helper'

RSpec.describe "spot_info/business_hours/index", type: :view do
  before(:each) do
    assign(:spot_info_business_hours, [
      SpotInfo::BusinessHour.create!(),
      SpotInfo::BusinessHour.create!()
    ])
  end

  it "renders a list of spot_info/business_hours" do
    render
  end
end
