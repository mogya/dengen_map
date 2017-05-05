module Postgis
  extend ActiveSupport::Concern

  def latlng_str
    "#{lat},#{lng}"
  end

  def lat
    set_latlng if @lat.nil?
    @lat
  end

  def lng
    set_latlng if @lng.nil?
    @lng
  end

  def lat=(val)
    @lat = val
    set_lonlat
  end

  def lng=(val)
    @lng = val
    set_lonlat
  end

  private
  def set_lonlat
    self.lonlat = "POINT(#{@lng} #{@lat})"
  end
  def set_latlng
    @lat = self.lonlat.y
    @lng = self.lonlat.x
  end
end
