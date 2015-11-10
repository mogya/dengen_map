FactoryGirl.define do
  factory :link1, class: Link do
    url 'http://example.com'
    link_type Link.link_types['official']
  end
  factory :link2, class: Link do
    url 'https://www.facebook.com/Cafe-Lingotto-451241385006942/'
    link_type Link.link_types['facebook']
  end

  factory :smoke_info_old, class: SpotInfo::Smoke do
    type 'SpotInfo::Smoke'
    value SpotInfo::Smoke.values['no_smoking']
  end

  factory :smoke_info, class: SpotInfo::Smoke do
    type 'SpotInfo::Smoke'
    value SpotInfo::Smoke.values['separated']
    detail 'テラスに喫煙所が用意されています'
  end

  factory :powersupply_info, class: SpotInfo::Powersupply do
    type 'SpotInfo::Powersupply'
    value SpotInfo::Powersupply.values['ng']
    detail '使用禁止の札が貼ってあります'
  end

  factory :dayoff_info, class: SpotInfo::Dayoff do
    type 'SpotInfo::Dayoff'
    detail '月曜日'
  end

  factory :business_hour_info, class: SpotInfo::BusinessHour do
    type 'SpotInfo::BusinessHour'
    detail '[火-金]10:00-20:00 [土日]10:00-23:00'
  end

  factory :tag_wifi1, class: Tag::Wifi do
    name 'SoftbankWifi'
    type 'Tag::Wifi'
  end

  factory :tag_wifi2, class: Tag::Wifi do
    name 'AU Wifi'
    type 'Tag::Wifi'
  end

  factory :tag_other1, class: Tag::Other do
    name 'イートインスペース'
    type 'Tag::Other'
  end

  factory :tag_category1, class: Tag::Category do
    name 'その他'
    type 'Tag::Category'
    importance 1
  end

  factory :tag_category2, class: Tag::Category do
    name 'コワーキングスペース'
    type 'Tag::Category'
    importance 2
  end

  factory :spot, class: Spot do |spot|
    name 'カフェ リンゴット'
    status Spot.statuses['hidden']
    address "愛知県常滑市新浜町3-7"
    lat 3490114
    lng 13682581
    spot.links{[
      FactoryGirl.build(:link1),
      FactoryGirl.build(:link2)
    ]}
    spot.spot_infos{[
      FactoryGirl.build(:smoke_info_old),
      FactoryGirl.build(:smoke_info),
      FactoryGirl.build(:powersupply_info),
      FactoryGirl.build(:dayoff_info),
      FactoryGirl.build(:business_hour_info)
    ]}
    spot.tags{[
      FactoryGirl.build(:tag_wifi1),
      FactoryGirl.build(:tag_wifi2),
      FactoryGirl.build(:tag_other1),
      FactoryGirl.build(:tag_category1),
      FactoryGirl.build(:tag_category2),
    ]}
  end
end
