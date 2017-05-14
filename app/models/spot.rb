class Spot < ApplicationRecord
  include Postgis
  include Taggable
  enum status: [ :status_hidden, :status_open, :status_pending, :status_closed, :status_down ]
  has_many :links, dependent: :destroy
  has_many :spot_infos, dependent: :destroy
  has_many :smoke_infos, -> { order("created_at DESC") }, class_name: 'SpotInfo::Smoke'
  has_many :powersupply_infos, -> { order("created_at DESC") }, class_name: 'SpotInfo::Powersupply'
  has_many :business_hour_infos, -> { order("created_at DESC") }, class_name: 'SpotInfo::BusinessHour'
  has_many :dayoff_infos, -> { order("created_at DESC") }, class_name: 'SpotInfo::Dayoff'

  accepts_nested_attributes_for :links, allow_destroy:true
  accepts_nested_attributes_for :spot_infos, allow_destroy:true

  def dayoff
    dayoff_infos.first.to_s
  end

  def business_hour
    business_hour_infos.first.to_s
  end

  def smoke
    smoke_infos.first.to_s
  end

  def powersupply
    powersupply_infos.first.to_s
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
