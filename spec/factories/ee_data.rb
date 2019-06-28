# frozen_string_literal: true

FactoryBot.define do
  factory :ee_datum do
    sequence(:spot_id) { |i| i }
    status { 'open' }
    ee_update_at { '2017-11-04 12:27:41' }
    factory :ee_datum_with_spot do
      after(:create) do |datum|
        datum.update_spot
        datum.spot.save
      end
    end
  end
end
