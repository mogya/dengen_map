# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Spots', type: :request do
  describe 'GET /' do
    context do
      before do
        create :ee_datum_with_spot, latitude: 36.1, longitude: 136.1
        create :ee_datum_with_spot, latitude: 36.0, longitude: 136
        create :ee_datum_with_spot, latitude: 37.1, longitude: 137.1
        create :ee_datum_with_spot, latitude: 36.0, longitude: 136.1, status: 'closed'
      end
      context 'basic case' do
        it do
          get api_v1_spots_path, params: { n: 37, s: 35, w: 135, e: 137 }
          expect(response).to have_http_status(200)
          expect(response.body).to include_json(
            "status": 'OK',
            "results": [
              {
                "latitude": 36.0,
                "longitude": 136.0,
                "distance": be_a_kind_of(Float)
              },
              {
                "latitude": 36.1,
                "longitude": 136.1,
                "distance": be_a_kind_of(Float)
              }
            ]
          )
          expect(response.body).not_to include_json(
            "results": [
              {
                "latitude": 37.1,
                "longitude": 137.1,
                "status": 'closed'
              }
            ]
          )
        end
      end
      context 'max_spots' do
        it do
          get api_v1_spots_path, params: { n: 36.5, s: 36.0, w: 136, e: 136.5, max_spots: 1 }
          expect(response).to have_http_status(200)
          expect(response.body).to include_json(
            "status": 'OK',
            "results": []
          )
        end
        it do
          get api_v1_spots_path, params: { n: 37, s: 35, w: 135, e: 137, max_spots: 1 }
          expect(response).to have_http_status(200)
          expect(response.body).to include_json(
            "status": 'TOO_MUCH_SPOTS'
          )
        end
      end
      context 'contains_invalid' do
        it do
          get api_v1_spots_path, params: { n: 37, s: 35, w: 135, e: 137, contains_invalid: true }
          expect(response.body).to include_json(
            "results": [
              {},
              {
                "latitude": 36.0,
                "longitude": 136.1,
                "status": 'closed'
              }
            ]
          )
        end
      end
    end
    context 'tag' do
      before do
        create :tag_other, name: 'A', importance: 1
        create :tag_other, name: 'B', importance: 2
        create :tag_other, name: 'D', importance: 4
        create :tag_other, name: 'C', importance: 3
        create :ee_datum_with_spot, title: 'A', latitude: 36.01, longitude: 136, tag: 'A'
        create :ee_datum_with_spot, title: 'A,B', latitude: 36.02, longitude: 136, tag: 'A,B'
        create :ee_datum_with_spot, title: 'A,C', latitude: 36.03, longitude: 136, tag: 'A,C'
        create :ee_datum_with_spot, title: 'C,D', latitude: 36.04, longitude: 136, tag: 'C,D'
      end
      it do
        get api_v1_spots_path, params: { n: 37, s: 35, w: 135, e: 137, tags: 'A,B' }
        expect(response.body).to include_json(
          "results": [
            # TODO: なぜかtagの順序がimportance順にならないバグがあるので、複数あるtagsはチェックできない
            { "title": 'A', "tags": [{ "name": 'A' }] },
            { "title": 'A,B' },
            { "title": 'A,C' }
          ]
        )
        expect(response.body).not_to include_json(
          "results": [
            { "title": 'C,D' }
          ]
        )
      end
    end
    context 'tag with space' do
      before do
        create :tag_other, name: 'A', importance: 1
        create :tag_other, name: 'B', importance: 2
        create :ee_datum_with_spot, title: 'A', latitude: 36.01, longitude: 136, tag: 'A'
        create :ee_datum_with_spot, title: 'A,B', latitude: 36.02, longitude: 136, tag: 'A,B'
      end
      it do
        get api_v1_spots_path, params: { n: 37, s: 35, w: 135, e: 137, tags: 'C, B' }
        expect(response.body).to include_json(
          "results": [
            { "title": 'A,B' }
          ]
        )
      end
    end
    context 'category' do
      before do
        create :tag_category, name: 'A', importance: 4
        create :tag_category, name: 'C', importance: 2
        create :tag_category, name: 'B', importance: 3
        create :tag_category, name: 'D', importance: 1
        create :ee_datum_with_spot, title: 'B', latitude: 36.01, longitude: 136, category: 'B'
        create :ee_datum_with_spot, title: 'A,B', latitude: 36.02, longitude: 136, category: 'A,B'
        create :ee_datum_with_spot, title: 'A,C', latitude: 36.03, longitude: 136, category: 'A,C'
        create :ee_datum_with_spot, title: 'D', latitude: 36.04, longitude: 136, category: 'D'
      end
      it do
        get api_v1_spots_path, params: { n: 37, s: 35, w: 135, e: 137, categories: 'B,C' }
        expect(response.body).to include_json(
          "results": [
            { title: 'B', "categories": [{ "name": 'B' }] },
            { title: 'A,B' },
            { title: 'A,C' }
          ]
        )
        expect(response.body).not_to include_json(
          "results": [
            { "categories": [{ "name": 'D' }] }
          ]
        )
      end
    end
    context 'wireless' do
      before do
        create :tag_wifi, name: 'B', importance: 2
        create :tag_wifi, name: 'C', importance: 3
        create :tag_wifi, name: 'D', importance: 4
        create :tag_wifi, name: 'A', importance: 1
        create :ee_datum_with_spot, title: 'A,B,C,D', latitude: 36.01, longitude: 136, wireless: 'A,B,C,D'
        create :ee_datum_with_spot, title: 'A,C', latitude: 36.02, longitude: 136, wireless: 'A,C'
        create :ee_datum_with_spot, title: 'B,C', latitude: 36.03, longitude: 136, wireless: 'B,C'
        create :ee_datum_with_spot, title: 'A', latitude: 36.04, longitude: 136, wireless: 'A'
      end
      it do
        get api_v1_spots_path, params: { n: 37, s: 35, w: 135, e: 137, wireless: 'A' }
        expect(response.body).to include_json(
          "results": [
            { title: 'A,B,C,D' },
            { title: 'A,C' },
            { title: 'A' }
          ]
        )
        expect(response.body).not_to include_json(
          "results": [
            { title: 'B,C' }
          ]
        )
      end
    end
  end
  describe 'GET /count' do
    context 'basic case' do
      before do
        create :ee_datum_with_spot, latitude: 36.1, longitude: 136.1
        create :ee_datum_with_spot, latitude: 36.0, longitude: 136
        create :ee_datum_with_spot, latitude: 37.1, longitude: 137.1
        create :ee_datum_with_spot, latitude: 36.0, longitude: 136.1, status: 'closed'
      end
      it do
        get api_v1_spots_count_path, params: { n: 37, s: 35, w: 135, e: 137 }
        expect(response).to have_http_status(200)
        expect(response.body).to include_json(
          "status": 'OK',
          "count": 2
        )
      end
    end
  end
end
