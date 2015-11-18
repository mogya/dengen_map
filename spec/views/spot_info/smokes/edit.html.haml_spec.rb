require 'rails_helper'

RSpec.describe "spot_info/smokes/edit", type: :view do
  before(:each) do
    @spot_info_smoke = assign(:spot_info_smoke, SpotInfo::Smoke.create!())
  end

  it "renders the edit spot_info_smoke form" do
    render

    assert_select "form[action=?][method=?]", spot_info_smoke_path(@spot_info_smoke), "post" do
    end
  end
end
