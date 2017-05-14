class SpotInfo::BusinessHour < SpotInfo
  after_create do
    self.name = '営業時間'
  end
end
