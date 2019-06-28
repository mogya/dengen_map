# frozen_string_literal: true

FactoryBot.define do
  factory :spot, class: Spot do
    name { 'カフェ リンゴット' }
    status { Spot.statuses['status_hidden'] }
    address { '愛知県常滑市新浜町3-7' }
  end
end
