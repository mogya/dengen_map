require 'rails_helper'

RSpec.describe "Tag::Others", type: :request do
  describe "GET /tag_others" do
    it "works! (now write some real specs)" do
      get tag_others_path
      expect(response).to have_http_status(200)
    end
  end
end
