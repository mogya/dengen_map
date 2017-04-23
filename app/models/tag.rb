class Tag < ApplicationRecord
  has_many :spots_tags
  has_many :spots, through: :spots_tags
  belongs_to :parent, class_name: 'Tag', foreign_key: :parent_id

  def to_s
    "#{name}(#{type})"
  end
end
