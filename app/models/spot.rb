class Spot < ApplicationRecord
  enum status: [ :status_hidden, :status_open, :status_pending, :status_closed, :status_down ]
  has_one :ee_datum, foreign_key:'spot_id', primary_key:'ee_id'
  delegate 'open?', to: :ee_datum
  delegate :url_pc, :wireless, :powersupply, :other,
            :tag, :status, :category,
            :expiration_date, :ee_update_at,
            to: :ee_datum

  def self.spots_in_range(
              n:, s:, w:, e:, latitude:nil, longitude:nil,
              tags:[], categories:[], wireless:[],
              limit:nil, contains_invalid:false
              )
    latitude = latitude || (n+s)/2.0
    longitude = longitude || (w+e)/2.0

    q = spots_in_range_query(n:n, s:s, w:w, e:e, latitude:latitude, longitude:longitude, limit:limit)
    spots_in_range_filter(q, tags:tags, categories:categories, wireless:wireless, contains_invalid:contains_invalid)
  end

  def longitude
    lonlat.try(:x)
  end

  def latitude
    lonlat.try(:y)
  end

  def prime_category(with_image=false)
    Tag::Category.prime_category(categories, with_image)
  end

  def categories
    category.split(/ *, */)
  end

  def icon
    prime_category(with_image:true).image_path.sub('[type]','none')
  end

  def powerframe_icon
    type = :unknown
    if ( tag.index('電源OK') ||tag.index('電源:お客様用コンセント') )
      type = :ok
    elsif ( tag.index('電源:実績あり')||tag.index('電源:壁コンセント') )
      type = :ok
    elsif ( tag.index('電源NG') || tag.index('電源:NG') )
      type = :ng
    end
    prime_category(with_image:true).image_path.sub('[type]',type.to_s)
  end

  # has_many :links
  # has_many :spot_infos
  # has_many :smoke_infos, class_name: 'SpotInfo::Smoke'
  # has_many :powersupply_infos, class_name: 'SpotInfo::Powersupply'
  # has_many :business_hour_infos, class_name: 'SpotInfo::BusinessHour'
  # has_many :dayoff_infos, class_name: 'SpotInfo::Dayoff'
  # has_many :spots_tags
  # has_many :tags, through: :spots_tags
  # has_many :wireless_tags, ->{order("importance DESC") }, class_name: 'Tag::Wifi', :through => :spots_tags, :source => :tag
  # has_many :other_tags, ->{order("importance DESC") }, class_name: 'Tag::Other', :through => :spots_tags, :source => :tag
  # has_many :category_tags, ->{order("importance DESC") }, class_name: 'Tag::Category', :through => :spots_tags, :source => :tag

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

  # def wireless
  #   wireless_tags.pluck(:name).join(', ')
  # end

  # def category
  #   category_tags.pluck(:name).join(', ')
  # end

  # def other
  #   other_tags.pluck(:name).join(', ')
  # end

  # # linksの中でもっとも公式にふさわしいURLを得る
  # # officialがあればそれを返す。それ以外の場合、facebookやtwitterなどがあればそれを返す
  # def official_link
  #   Link.official_link(links)
  # end

  private

  def self.spots_in_range_query(
              n:, s:, w:, e:, latitude:nil, longitude:nil, limit:nil
      )
    geo_query = "ST_Contains( ST_GeomFromText('%s',4326), lonlat) = TRUE"%Wkt.polygon(n,s,w,e)
    distance_column = <<~"EOT"
      ST_Distance(
                    ST_Transform(lonlat, 3099),
                    ST_Transform( ST_GeomFromText('POINT(#{longitude} #{latitude})',4326), 3099)
                  )/1000 AS distance
    EOT
    q = Spot.where(geo_query).includes(:ee_datum).select('spots.*',distance_column).order('distance')
    if limit
      q = q.limit(limit)
    end
    q
  end

  def self.spots_in_range_filter(spots,tags:[], categories:[], wireless:[],contains_invalid:false)
    l = lambda do |spot|
      unless contains_invalid
        return false unless spot.open?
      end
      tags.each do |tag|
        return false unless spot.ee_datum.tag.include?(tag)
      end
      categories.each do |category|
        return false unless spot.ee_datum.category.include?(category)
      end
      wireless.each do |w|
        return false unless spot.ee_datum.wireless.include?(w)
      end
      return true
    end

    spots.select(&l)
  end

end
