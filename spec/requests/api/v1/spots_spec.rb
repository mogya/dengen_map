require 'rails_helper'
require "spec_helper"

RSpec.describe "Spots", type: :request do
  describe "GET /" do
    context do
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
        create :ee_datum_with_spot, latitude:36.1, longitude:136.1, tag:'B'
        create :ee_datum_with_spot, latitude:37.1, longitude:137.1, tag:'A'
      end
      it do
        get api_v1_spots_path, params:{n:37, s:35, w:135, e:137, tag:'A'}
        expect(response.body).to include_json({
          "results": [
            {
              "latitude": 36.0,
              "longitude": 136.0,
              "tag": ['A']
            }
          ]
        })
        expect(response.body).not_to include_json({
          "results": [
            {
              "latitude": 37.1,
              "longitude": 137.1,
              "tag": ['B']
            }
          ]
        })
      end
    end
    context 'category' do
      before do
        create :ee_datum_with_spot, latitude:36.0, longitude:136, category:'A'
        create :ee_datum_with_spot, latitude:36.1, longitude:136.1, category:'B'
        create :ee_datum_with_spot, latitude:37.1, longitude:137.1, category:'A'
      end
      it do
        get api_v1_spots_path, params:{n:37, s:35, w:135, e:137, category:'A'}
        expect(response.body).to include_json({
          "results": [
            {
              "latitude": 36.0,
              "longitude": 136.0,
              "category": ['A']
            }
          ]
        })
        expect(response.body).not_to include_json({
          "results": [
            {
              "latitude": 37.1,
              "longitude": 137.1,
              "category": ['B']
            }
          ]
        })
      end
    end
    context 'wireless' do
      before do
        create :ee_datum_with_spot, latitude:36.0, longitude:136, wireless:'A'
        create :ee_datum_with_spot, latitude:36.1, longitude:136.1, wireless:'B'
        create :ee_datum_with_spot, latitude:37.1, longitude:137.1, wireless:'A'
      end
      it do
        get api_v1_spots_path, params:{n:37, s:35, w:135, e:137, wireless:'A'}
        expect(response.body).to include_json({
          "results": [
            {
              "latitude": 36.0,
              "longitude": 136.0,
              "wireless": ['A']
            }
          ]
        })
        expect(response.body).not_to include_json({
          "results": [
            {
              "latitude": 37.1,
              "longitude": 137.1,
              "wireless": ['B']
            }
          ]
        })
      end
    end
  end
end
