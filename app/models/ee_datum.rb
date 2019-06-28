# frozen_string_literal: true

class EeDatum < ApplicationRecord
  has_one :spot, foreign_key: 'ee_id', primary_key: 'spot_id'
  after_save :update_spot

  def set_by_json!(entry)
    self.spot_id = entry['entry_id']
    self.title = entry['title']
    self.url_title = entry['url_title']
    self.category = entry['category'].join(',')
    self.address = entry['address']
    self.tel = entry['tel']
    self.latitude = entry['latitude']
    self.longitude = entry['longitude']
    self.url_pc = entry['url_pc']
    self.url_mobile = entry['url_mobile']
    self.wireless = entry['wireless']
    self.powersupply = entry['powersupply']
    self.tag = entry['tag']
    self.other = entry['other']
    self.reference_urls = entry['reference_urls']
    self.private_data = entry['private_data']
    self.status = entry['status']
    self.expiration_date = Time.zone.parse(entry['expiration_date'].to_s)
    self.ee_update_at = Time.zone.parse(entry['edit_date'].to_s)
    justify!
  end

  def self.update_or_create_by_json(entry, force_update = false)
    datum = find_or_create_by(spot_id: entry['entry_id'])
    if force_update || datum.ee_update_at.nil? || datum.ee_update_at < Time.zone.parse(entry['edit_date'].to_s)
      datum.set_by_json!(entry)
      datum.save
      datum.update_spot
    end
    datum
  end

  def categories
    category.split(/ *, */)
  end

  def update_spot
    self.spot = Spot.new(ee_id: spot_id) if spot.nil?
    spot.name = title
    spot.status = :status_closed
    spot.status = :status_open if open?
    spot.address = address
    spot.add_tags(category)
    spot.add_tags(wireless)
    spot.add_tags(tag)
    spot.tel = tel
    spot.ee_id = spot_id
    spot.lonlat = "POINT (#{longitude} #{latitude})"
    spot.prime_category = Tag::Category.prime_category(spot.category_tags)
    spot.save
  end

  def justify!
    wireless.gsub!('TullysWi-Fi', 'Tullys Wi-Fi')
    wireless.gsub!('マクドナルドWi-Fi', 'マクドナルドWiFi')
    wireless.gsub!('docomoWi-Fi', 'docomo Wi-Fi')
    wireless.gsub!('SoftbankWifi', 'ソフトバンクWi-Fi')
    wireless.gsub!('Wi-FiNex', 'Wi-Fi Nex')
    wireless.gsub!('Wi-FiNex', 'Wi-Fi Nex')
    wireless.gsub!('フレッツ・スポット（NTT東日本）', 'フレッツ・スポット')
    self.wireless = Tag.split(wireless).uniq.join(',')
    tag.gsub!('電源あり', '電源:お客様用コンセント')
    tag.gsub!('電源OK', '電源:お客様用コンセント')
    tag.gsub!('電源:実績あり', '電源:壁コンセント')
    tag.gsub!('電源NG', '電源:NG')
    tag.gsub!('電源:なし', '電源:NG')
    tag.gsub!('携帯充電器', '電源:充電器貸出')
    self.tag = Tag.split(tag).uniq.join(',')
  end

  def open?
    return false if status != 'open'
    return false if expiration_date && (expiration_date < Time.zone.now)

    true
  end
end
