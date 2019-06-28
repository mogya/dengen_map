# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landings', type: :request do
  describe 'GET /' do
    it 'rootページが取得できること' do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
