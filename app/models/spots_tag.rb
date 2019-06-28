# frozen_string_literal: true

class SpotsTag < ApplicationRecord
  belongs_to :spot
  belongs_to :tag
end
