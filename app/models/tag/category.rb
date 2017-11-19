class Tag::Category < Tag
  IMAGE_PREFIX = '//oasis.mogya.com/images/design/'
  class_attribute :categories_cache_data

  def self.prime_category(categories, with_image=false)
    candidate_category = nil
    categories.each do |category|
      # tag = Tag::Category.find_by(name:category)
      tag = categories_cache[category]
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


  private
  # todo とっても読みづらいし、いつキャッシュが更新されるのか怪しい(セッションごとじゃないっぽい？)ので、変更時に反映されないおそれがある。
  # spot側に演算済みカテゴリのキャッシュを持つようにした方がいいかも。
  def self.categories_cache
    if Tag::Category.categories_cache_data.nil?
      Tag::Category.categories_cache_data = {}
      Tag::Category.all.each do |category|
        Tag::Category.categories_cache_data[category.name] = category
      end
    end
    Tag::Category.categories_cache_data
  end
end
