json.array!(@tag_others) do |tag_other|
  json.extract! tag_other, :id
  json.url tag_other_url(tag_other, format: :json)
end
