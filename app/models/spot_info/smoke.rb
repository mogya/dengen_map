# frozen_string_literal: true

class SpotInfo::Smoke < SpotInfo
  # 全席喫煙可能、禁煙、分煙
  enum value: %i[full_smoking no_smoking separated]

  def to_s
    ret = value_string
    ret += "(#{detail})" unless detail.nil?
    ret
  end

  private

  def value_string
    if full_smoking?
      '全席喫煙'
    elsif no_smoking?
      '全席禁煙'
    elsif separated?
      '分煙'
    end
  end
end
