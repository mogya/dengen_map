class SpotInfo::Smoke < SpotInfo
  # 全席喫煙可能、禁煙、分煙
  enum value: [ :unknown, :full_smoking, :no_smoking, :separated]
  after_create do
    self.name = 'タバコ'
  end

  def self.spot_info(text)
    spot_info = super(text)
    case text
    when /全席禁煙/
      spot_info.no_smoking!
    when /分煙/
      spot_info.separated!
    when /全席喫煙/
      spot_info.full_smoking!
    else
      spot_info.unknown!
      Rails.logger.warn('unknown smoking info:'+text)
    end
    spot_info
  end

  def to_s
    v = value_string
    v += "(#{detail})" unless detail.nil?
    return "#{name}:#{v}"
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
