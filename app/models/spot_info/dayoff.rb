class SpotInfo::Dayoff < SpotInfo
  after_create do
    self.name = '定休日'
  end
end
