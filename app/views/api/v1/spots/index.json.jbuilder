json.results @spots do |spot|
  json.id spot.ee_id
  json.title spot.name
  json.address spot.address
  json.tel spot.tel
  json.latitude spot.latitude
  json.longitude spot.longitude
  json.url spot.url_pc
  json.wireless spot.wireless.split(',')
  json.category spot.category.split(',')
  json.tag spot.tag.split(',')
  json.other spot.other
  json.distance spot.distance
  json.status spot.open? ? 'open' : 'closed'
  json.expiration_date spot.expiration_date
  json.mo_url spot.mo_url
  json.icon spot.icon
  json.icon_powerframe spot.powerframe_icon
end
json.status 'OK'
