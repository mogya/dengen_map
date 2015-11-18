require 'rails_helper'

RSpec.describe "spot_info/smokes/new", type: :view do
  before(:each) do
    assign(:spot_info_smoke, SpotInfo::Smoke.new())
  end

  it "renders new spot_info_smoke form" do
    render

    assert_select "form[action=?][method=?]", spot_info_smokes_path, "post" do
    end
  end
end
