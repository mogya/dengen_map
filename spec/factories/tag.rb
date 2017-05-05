FactoryGirl.define do
  factory :tag do |tag|
    name 'SoftbankWifi'
    type 'Tag::Wifi'
    image 'http://oasis.mogya.com/images/design/spot_icon_18_[type]_[size]px.png'
    importance 0
    sprite_pos 1
  end

  factory :tag_wifi, class: Tag::Wifi do
    name 'SoftbankWifi'
    type 'Tag::Wifi'
    image 'http://oasis.mogya.com/images/design/spot_icon_18_[type]_[size]px.png'
    importance 0
    sprite_pos 1
  end

  factory :tag_other, class: Tag::Other do
    name 'イートインスペース'
    type 'Tag::Other'
    image 'http://oasis.mogya.com/images/design/spot_icon_18_[type]_[size]px.png'
    importance 0
    sprite_pos 1
  end

  factory :tag_category, class: Tag::Category do
    name 'コワーキングスペース'
    type 'Tag::Category'
    image 'http://oasis.mogya.com/images/design/spot_icon_18_[type]_[size]px.png'
    importance 0
    sprite_pos 1
  end
end
