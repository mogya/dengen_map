class SpotsTag < ActiveRecord::Base
  belongs_to :spot
  belongs_to :tag
end
