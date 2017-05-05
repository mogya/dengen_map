class Spot < ApplicationRecord
  include Postgis
  enum status: [ :status_hidden, :status_open, :status_pending, :status_closed, :status_down ]
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

  accepts_nested_attributes_for :links, allow_destroy:true
  accepts_nested_attributes_for :spot_infos, allow_destroy:true

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
