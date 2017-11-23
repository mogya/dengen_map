require 'rails_helper'
require "spec_helper"

RSpec.describe "Spots", type: :request do
  describe "GET /" do
    context 'basic case' do
      before do
        create :ee_datum_with_spot, latitude:36.0, longitude:136
        create :ee_datum_with_spot, latitude:36.1, longitude:136.1
        create :ee_datum_with_spot, latitude:37.1, longitude:137.1
        create :ee_datum_with_spot, latitude:36.0, longitude:136.1, status:'closed'
      end
      it do
        get api_v1_spots_path, params:{n:37, s:35, w:135, e:137}
        expect(response).to have_http_status(200)
        expect(response.body).to include_json({
          "status": "OK",
          "results": [
            {
              "latitude": 36.0,
              "longitude": 136.0,
              "distance": (be_a_kind_of(Float))
            },
            {
              "latitude": 36.1,
              "longitude": 136.1,
              "distance": (be_a_kind_of(Float))
            }
          ]
        })
        expect(response.body).not_to include_json({
          "results": [
            {
              "latitude": 37.1,
              "longitude": 137.1,
              "status": 'closed'
            }
          ]
        })
      end
      it 'contains_invalid' do
        get api_v1_spots_path, params:{n:37, s:35, w:135, e:137, contains_invalid:true}
        expect(response.body).to include_json({
          "results": [
            {},
            {
              "latitude": 36.0,
              "longitude": 136.1,
              "status": 'closed'
            }
          ]
        })
      end
    end
    context 'tag' do
      before do
        create :ee_datum_with_spot, latitude:36.0, longitude:136, tag:'A'
        create :ee_datum_with_spot, latitude:36.0, longitude:136, tag:'A,B'
        create :ee_datum_with_spot, latitude:36.0, longitude:136, tag:'A,C'
        create :ee_datum_with_spot, latitude:36.0, longitude:136, tag:'C,D'
      end
      it do
        get api_v1_spots_path, params:{n:37, s:35, w:135, e:137, tags:'A,B'}
        Rails.logger.debug("EeDatum.count:#{EeDatum.count}")
        Rails.logger.debug("Spots.count:#{Spot.count}")
        Rails.logger.debug(response.body)
        expect(response.body).to include_json({
          "results": [
            { "tags": ['A'] },
            { "tags": ['A','B'] },
            { "tags": ['A','C'] },
          ]
        })
        expect(response.body).not_to include_json({
          "results": [
            { "tags": ['C','D'] },
          ]
        })
      end
    end
    context 'category' do
      before do
        create :ee_datum_with_spot, latitude:36.0, longitude:136, category:'B'
        create :ee_datum_with_spot, latitude:36.0, longitude:136, category:'A,B'
        create :ee_datum_with_spot, latitude:36.0, longitude:136, category:'A,C'
        create :ee_datum_with_spot, latitude:36.0, longitude:136, category:'D'
      end
      it do
        get api_v1_spots_path, params:{n:37, s:35, w:135, e:137, categories:'B,C'}
        expect(response.body).to include_json({
          "results": [
            { "categories": ['B'] },
            { "categories": ['A','B'] },
            { "categories": ['A','C'] },
          ]
        })
        expect(response.body).not_to include_json({
          "results": [
            { "categories": ['D'] },
          ]
        })
      end
    end
    context 'wireless' do
      before do
        create :ee_datum_with_spot, latitude:36.0, longitude:136, wireless:'A,B,C,D'
        create :ee_datum_with_spot, latitude:36.0, longitude:136, wireless:'A,C'
        create :ee_datum_with_spot, latitude:36.0, longitude:136, wireless:'B,C'
        create :ee_datum_with_spot, latitude:36.0, longitude:136, wireless:'C,A'
      end
      it do
        get api_v1_spots_path, params:{n:37, s:35, w:135, e:137, wireless:'A'}
        expect(response.body).to include_json({
          "results": [
            { "wireless": ['A','B','C','D'] },
            { "wireless": ['A','C'] },
            { "wireless": ['C','A'] },
          ]
        })
        expect(response.body).not_to include_json({
          "results": [
            { "wireless": ['B','C'] },
          ]
        })
      end
    end
  end
end
