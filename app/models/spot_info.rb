class SpotInfo < ApplicationRecord
  belongs_to :spot

  def self.spot_info(text)
    build(
      detail: text
    )
  end

  def self.spot_infos(html)
    return [] if html.scan('<dt>')
    html.gsub(%r{<dl><dt>|</dd></dl>},'').split('</dd><dt>').map do |line|
      key,value = line.split('</dt><dd>')
      case key
      when /客席数/
        SpotInfo::Other.create(name:key, detail:value)
      when /駐車場/
        SpotInfo::Other.create(name:key, detail:value)
      when /タバコ/
        SpotInfo::Smoke.spot_info(value)
      when /営業時間/
        SpotInfo::BusinessHour.spot_info(value)
      when /定休日/
        SpotInfo::Dayoff.spot_info(value)
      end
    end
  end

  def to_s
    "#{name}:#{detail}"
  end
end
