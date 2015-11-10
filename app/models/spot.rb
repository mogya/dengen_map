class Spot < ActiveRecord::Base
  enum status: [ :hidden, :open, :pending, :closed, :down ]
  has_many :links
  has_many :spot_infos
  has_many :smoke_infos, class_name: 'SpotInfo::Smoke'
  has_many :powersupply_infos, class_name: 'SpotInfo::Powersupply'
  has_many :business_hour_infos, class_name: 'SpotInfo::BusinessHour'
  has_many :dayoff_infos, class_name: 'SpotInfo::Dayoff'
  has_many :spots_tags
  has_many :tags, through: :spots_tags
  has_many :wifi_tags, ->{order("importance DESC") }, class_name: 'Tag::Wifi', :through => :spots_tags, :source => :tag
  has_many :other_tags, ->{order("importance DESC") }, class_name: 'Tag::Other', :through => :spots_tags, :source => :tag
  has_many :category_tags, ->{order("importance DESC") }, class_name: 'Tag::Category', :through => :spots_tags, :source => :tag

  LATLNG_MULTIPLIER = 100000 # lat,lngは、整数で扱うためにLATLNG_MULTIPLIER倍して格納されている

  def latitude
    self.lat.to_f / LATLNG_MULTIPLIER
  end
  def longitude
    self.lng.to_f / LATLNG_MULTIPLIER
  end
  def latitude=(value)
    self.lat = (value.to_f * LATLNG_MULTIPLIER).to_i
  end
  def longitude=(value)
    self.lng = (value.to_f * LATLNG_MULTIPLIER).to_i
  end
  def latlng_str
    "#{self.latitude},#{self.longitude}"
  end

  def dayoff
    dayoff_infos.last.to_s
  end

  def businesstime
    businesstime_infos.last.to_s
  end

  def smoke
    smoke_infos.last.to_s
  end

  def powersupply
    powersupply_infos.last.to_s
  end

  def wifi
    wifi_tags.pluck(:name).join(', ')
  end

  def category
    category_tags.pluck(:name).join(', ')
  end

  def other
    other_tags.pluck(:name).join(', ')
  end

  # linksの中でもっとも公式にふさわしいURLを得る
  # officialがあればそれを返す。それ以外の場合、facebookやtwitterなどがあればそれを返す
  def official_link
    Link.official_link(links)
  end

  def to_s
    name
  end

end
