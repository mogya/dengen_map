module Wkt
  module_function

  def polygon(n,s,w,e)
    "POLYGON((#{w} #{n}, #{w} #{s}, #{e} #{s}, #{e} #{n}, #{w} #{n}))"
  end
end
