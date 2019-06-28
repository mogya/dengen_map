# frozen_string_literal: true

module SpotInRangable
  extend ActiveSupport::Concern
  class_methods do
    def spots_in_range(
      n:, s:, w:, e:, latitude: nil, longitude: nil,
      tags: [], categories: [], wireless: [],
      limit: nil, contains_invalid: false
    )
      latitude ||= (n + s) / 2.0
      longitude ||= (w + e) / 2.0

      q = spots_in_range_query(n: n, s: s, w: w, e: e, latitude: latitude, longitude: longitude, limit: limit)
      spots_in_range_filter(q, tags: tags, categories: categories, wireless: wireless, contains_invalid: contains_invalid)
    end

    private

    def spots_in_range_query(
      n:, s:, w:, e:, latitude: nil, longitude: nil, limit: nil
    )
      geo_query = format("ST_Contains( ST_GeomFromText('%s',4326), lonlat) = TRUE", Wkt.polygon(n, s, w, e))
      distance_column = <<~"EOT"
        ST_Distance(
                      ST_Transform(lonlat, 3099),
                      ST_Transform( ST_GeomFromText('POINT(#{longitude} #{latitude})',4326), 3099)
                    )/1000 AS distance
      EOT
      q = Spot.where(geo_query).includes(:ee_datum, :prime_category, :category_tags, :wireless_tags, :other_tags).select('spots.*', distance_column).order('distance')
      q = q.limit(limit) if limit
      q
    end

    def spots_in_range_filter(spots, tags: [], categories: [], wireless: [], contains_invalid: false)
      l = lambda do |spot|
        unless contains_invalid
          return false unless spot.open?
        end
        return false if tags.present? && tags.all? do |tag|
          !spot.ee_datum.tag.include?(tag)
        end
        return false if categories.present? && categories.all? do |category|
          !spot.ee_datum.category.include?(category)
        end
        return false if wireless.present? && wireless.all? do |wifi|
          !spot.ee_datum.wireless.include?(wifi)
        end

        return true
      end
      spots.select(&l)
    end
  end
end
