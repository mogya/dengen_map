class Tag::Category < Tag

  def self.prime_category(category_tags)
    prime_category = nil
    category_tags.each do |category|
      next if (category.image.nil?)
      if prime_category.nil? || (prime_category.importance <= category.importance)
        prime_category = category
      end
    end
    prime_category
  end
end
