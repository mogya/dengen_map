require 'rails_helper'

RSpec.describe "Tag::Categories", type: :request do
  describe "GET /tag_categories" do
    it "works! (now write some real specs)" do
      get tag_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
