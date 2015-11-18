require 'rails_helper'

RSpec.describe "spot_info/dayoffs/index", type: :view do
  before(:each) do
    assign(:spot_info_dayoffs, [
      SpotInfo::Dayoff.create!(),
      SpotInfo::Dayoff.create!()
    ])
  end

  it "renders a list of spot_info/dayoffs" do
    render
  end
end
