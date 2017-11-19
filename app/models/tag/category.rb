class Tag::Category < Tag
  IMAGE_PREFIX = '//oasis.mogya.com/images/design/'

  def self.prime_category(categories, with_image=false)
    candidate_category = nil
    categories.each do |category|
      tag = Tag::Category.find_by(name:category)
      next if (with_image && tag.image.nil?)
      if candidate_category.nil? || (candidate_category.importance <= tag.importance)
        candidate_category = tag
      end
    end
    candidate_category
  end

  def image_path
    "#{IMAGE_PREFIX}#{image}" if image
  end
end
