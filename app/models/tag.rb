class Tag < ApplicationRecord
  has_many :spots_tags
  has_many :spots, through: :spots_tags
  belongs_to :parent, class_name: 'Tag', foreign_key: :parent_id

  def to_s
    "#{name}(#{type})"
  end

  def self.tags(names)
    names_ary = names.kind_of?(String) ? names.split(/, */) : names
    names_ary.map{|name_candidate| [name_candidate, find_by(name:name_candidate)]}.to_h
  end
end
