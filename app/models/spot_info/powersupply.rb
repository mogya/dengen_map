# frozen_string_literal: true

class SpotInfo::Powersupply < SpotInfo
  enum value: %i[ng possible ok]

  def to_s
    ret = value_string
    ret += "(#{detail})" unless detail.nil?
    ret
  end

  private

  def value_string
    if ng?
      '利用不可'
    elsif possible?
      '壁コンセント(許可が必要)'
    elsif ok?
      'お客様用コンセントあり'
    end
  end
end
