require 'rails_helper'

RSpec.describe "spot_info/business_hours/edit", type: :view do
  before(:each) do
    @spot_info_business_hour = assign(:spot_info_business_hour, SpotInfo::BusinessHour.create!())
  end

  it "renders the edit spot_info_business_hour form" do
    render

    assert_select "form[action=?][method=?]", spot_info_business_hour_path(@spot_info_business_hour), "post" do
    end
  end
end
