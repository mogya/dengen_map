class EeDatum < ApplicationRecord
  has_one :spot, foreign_key:'ee_id', primary_key:'spot_id'
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
    self.url_pc  = entry['url_pc']
    self.url_mobile  = entry['url_mobile']
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

  def self.update_or_create_by_json(entry, force_update=false)
    datum = find_or_create_by(spot_id:entry['entry_id'])
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
    if self.spot.nil?
      self.spot = Spot.new(ee_id:self.spot_id)
    end
    self.spot.name = self.title
    self.spot.status = :status_closed
    self.spot.status = :status_open if self.open?
    self.spot.address = self.address
    self.spot.add_tags(self.category)
    self.spot.add_tags(self.wireless)
    self.spot.add_tags(self.tag)
    self.spot.tel = self.tel
    self.spot.ee_id = self.spot_id
    self.spot.lonlat = "POINT (#{self.longitude} #{self.latitude})"
    self.spot.prime_category = Tag::Category.prime_category( spot.category_tags )
    self.spot.save
  end

  def justify!
    self.wireless.gsub!('TullysWi-Fi','Tullys Wi-Fi')
    self.wireless.gsub!('マクドナルドWi-Fi','マクドナルドWiFi')
    self.wireless.gsub!('docomoWi-Fi','docomo Wi-Fi')
    self.wireless.gsub!('SoftbankWifi','ソフトバンクWi-Fi')
    self.wireless.gsub!('Wi-FiNex','Wi-Fi Nex')
    self.wireless.gsub!('Wi-FiNex','Wi-Fi Nex')
    self.wireless.gsub!('フレッツ・スポット（NTT東日本）','フレッツ・スポット')
    self.wireless = self.wireless.split(/ *, */).uniq.join(',')
    self.tag.gsub!('電源あり','電源:お客様用コンセント')
    self.tag.gsub!('電源OK','電源:お客様用コンセント')
    self.tag.gsub!('電源:実績あり','電源:壁コンセント')
    self.tag.gsub!('電源NG','電源:NG')
    self.tag.gsub!('電源:なし','電源:NG')
    self.tag.gsub!('携帯充電器','電源:充電器貸出')
    self.tag = self.tag.split(/ *, */).uniq.join(',')
  end

  def open?
    return false if status != 'open'
    return false if expiration_date && (expiration_date < Time.zone.now)
    return true
  end
end
