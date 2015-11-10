class SpotInfo::Smoke < SpotInfo
  # 全席喫煙可能、禁煙、分煙
  enum value: [ :full_smoking, :no_smoking, :separated]

  def to_s
    ret = value_string
    ret += "(#{detail})" unless detail.nil?
    return ret
  end

  private

  def value_string
    case
    when full_smoking?
      '全席喫煙'
    when no_smoking?
      '全席禁煙'
    when separated?
      '分煙'
    end
  end
end
