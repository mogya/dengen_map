class SpotInfo::Powersupply < SpotInfo
  enum value: [ :ng, :possible, :ok]

  def to_s
    ret = value_string
    ret += "(#{detail})" unless detail.nil?
    return ret
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
    end
  end

end
