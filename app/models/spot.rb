# frozen_string_literal: true

class Spot < ApplicationRecord
  include SpotInRangable
  enum status: %i[status_hidden status_open status_pending status_closed status_down]
  has_one :ee_datum, foreign_key: 'spot_id', primary_key: 'ee_id', dependent: :destroy
  has_many :spots_tags
  has_many :tags, through: :spots_tags
  has_many :wireless_tags, -> { order('importance DESC') }, class_name: 'Tag::Wifi', through: :spots_tags, source: :tag
  has_many :other_tags, -> { order('importance DESC') }, class_name: 'Tag::Other', through: :spots_tags, source: :tag
  has_many :category_tags, -> { order('importance DESC') }, class_name: 'Tag::Category', through: :spots_tags, source: :tag
  belongs_to :prime_category, class_name: 'Tag::Category'
  delegate 'open?', to: :ee_datum
  delegate :url_pc, :powersupply, :other,
           :url_title,
           :expiration_date, :ee_update_at,
           to: :ee_datum

  def longitude
    lonlat.try(:x)
  end

  def latitude
    lonlat.try(:y)
  end

  def status_string
    status.to_s.sub('status_', '')
  end

  def mo_url
    "https://oasis.mogya.com/spot/#{url_title}"
  end

  def categories
    category_tags.map(&:name).join(',')
  end

  def wirelesses
    wireless_tags.map(&:name).join(',')
  end

  def others
    other_tags.map(&:name).join(',')
  end

  def add_tags(tag_names)
    Tag.split(tag_names).each do |tag_name|
      tag_name = tag_name.gsub(/[\[\]\"]/, '').strip
      tag = Tag.find_by(name: tag_name)
      if tag.nil?
        logger.warn("unknown tag:#{tag_name}")
        next
      end
      tags << tag unless tags.include?(tag)
    end
  end

  def icon
    prime_category.image_path.sub('[type]', 'none')
  end

  # has_many :links
  # has_many :spot_infos
  # has_many :smoke_infos, class_name: 'SpotInfo::Smoke'
  # has_many :powersupply_infos, class_name: 'SpotInfo::Powersupply'
  # has_many :business_hour_infos, class_name: 'SpotInfo::BusinessHour'
  # has_many :dayoff_infos, class_name: 'SpotInfo::Dayoff'
  # accepts_nested_attributes_for :links, allow_destroy:true
  # accepts_nested_attributes_for :spot_infos, allow_destroy:true

  # def dayoff
  #   dayoff_infos.last.to_s
  # end

  # def businesstime
  #   businesstime_infos.last.to_s
  # end

  # def smoke
  #   smoke_infos.last.to_s
  # end

  # def powersupply
  #   powersupply_infos.last.to_s
  # end
  # # linksの中でもっとも公式にふさわしいURLを得る
  # # officialがあればそれを返す。それ以外の場合、facebookやtwitterなどがあればそれを返す
  # def official_link
  #   Link.official_link(links)
  # end
end
