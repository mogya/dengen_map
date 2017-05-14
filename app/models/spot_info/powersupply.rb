class SpotInfo::Powersupply < SpotInfo
  # 当面はタグの方使ってこっちは使わない。投票システムのときに使うかも？
  enum value: [ :ng, :possible, :ok, :netcafe]
  after_create do
    self.name = '電源'
  end

  def to_s
    v = value_string
    v += "(#{detail})" unless detail.nil?
    return "#{name}:#{v}"
  end

  private

  def value_string
    case
    when ng?
      '利用不可'
    when possible?
      '壁コンセント(許可が必要)'
    when ok?
      'お客様用コンセントあり'
    when netcafe?
      'たぶんOK(ネットカフェ)'
    end
  end
end
