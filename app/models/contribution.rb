# frozen_string_literal: true

# comments, new spot informations, corrections...
class Contribution < ApplicationRecord
  enum category: %i[proposal comment fix closed], _prefix: true
  enum status: %i[new open closed spam], _prefix: true
  belongs_to :user, optional: true
  belongs_to :spot
end
