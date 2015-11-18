require 'rails_helper'

RSpec.describe "SpotInfo::Smokes", type: :request do
  describe "GET /spot_info_smokes" do
    it "works! (now write some real specs)" do
      get spot_info_smokes_path
      expect(response).to have_http_status(200)
    end
  end
end
