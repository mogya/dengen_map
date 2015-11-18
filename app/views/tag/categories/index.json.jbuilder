json.array!(@tag_categories) do |tag_category|
  json.extract! tag_category, :id
  json.url tag_category_url(tag_category, format: :json)
end
