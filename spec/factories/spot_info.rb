FactoryBot.define do
  factory :spot_info, class: SpotInfo do
    type 'SpotInfo::Smoke'
    value SpotInfo::Smoke.values['separated']
    detail 'テラスに喫煙所が用意されています'
  end

  factory :spot_info_smoke, class: SpotInfo::Smoke do
    type 'SpotInfo::Smoke'
    value SpotInfo::Smoke.values['separated']
    detail 'テラスに喫煙所が用意されています'
  end

  factory :spot_info_powersupply, class: SpotInfo::Powersupply do
    type 'SpotInfo::Powersupply'
    value SpotInfo::Powersupply.values['ng']
    detail '使用禁止の札が貼ってあります'
  end

  factory :spot_info_dayoff, class: SpotInfo::Dayoff do
    type 'SpotInfo::Dayoff'
    detail '月曜日'
  end

  factory :spot_info_business_hour, class: SpotInfo::BusinessHour do
    type 'SpotInfo::BusinessHour'
    detail '[火-金]10:00-20:00 [土日]10:00-23:00'
  end
end
