json.array!(@tag_wifis) do |tag_wifi|
  json.extract! tag_wifi, :id
  json.url tag_wifi_url(tag_wifi, format: :json)
end
