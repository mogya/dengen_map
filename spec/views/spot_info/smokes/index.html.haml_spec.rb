require 'rails_helper'

RSpec.describe "spot_info/smokes/index", type: :view do
  before(:each) do
    assign(:spot_info_smokes, [
      SpotInfo::Smoke.create!(),
      SpotInfo::Smoke.create!()
    ])
  end

  it "renders a list of spot_info/smokes" do
    render
  end
end
