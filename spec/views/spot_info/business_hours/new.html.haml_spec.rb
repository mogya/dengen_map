require 'rails_helper'

RSpec.describe "spot_info/business_hours/new", type: :view do
  before(:each) do
    assign(:spot_info_business_hour, SpotInfo::BusinessHour.new())
  end

  it "renders new spot_info_business_hour form" do
    render

    assert_select "form[action=?][method=?]", spot_info_business_hours_path, "post" do
    end
  end
end
