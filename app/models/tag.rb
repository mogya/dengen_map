class Tag < ApplicationRecord
  IMAGE_PREFIX = '//oasis.mogya.com/images/design/'

  has_many :spots_tags, dependent: :destroy
  has_many :spots, through: :spots_tags
  belongs_to :parent, class_name: 'Tag', foreign_key: :parent_id

  def image_path
    "#{IMAGE_PREFIX}#{image}" if image
  end

  def to_s
    "#{name}(#{type})"
  end

  def self.split(tags)
    tags.split(/ *,+ */)
  end
end
