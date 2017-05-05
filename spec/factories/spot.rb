FactoryGirl.define do
  factory :spot, class: Spot do |spot|
    name 'カフェ リンゴット'
    status Spot.statuses['status_hidden']
    address "愛知県常滑市新浜町3-7"
  end
end
