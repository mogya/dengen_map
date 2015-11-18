require 'rails_helper'

RSpec.describe "Tag::Wifis", type: :request do
  describe "GET /tag_wifis" do
    it "works! (now write some real specs)" do
      get tag_wifis_path
      expect(response).to have_http_status(200)
    end
  end
end
