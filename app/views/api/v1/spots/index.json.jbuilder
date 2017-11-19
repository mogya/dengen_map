json.results @spots do |spot|
  json.id spot.ee_id
  json.address spot.address
  json.latitude spot.latitude
  json.longitude spot.longitude
  json.url spot.url_pc
  json.wireless spot.wireless.split(',')
  json.powersupply spot.powersupply
  json.tel spot.tel
  json.other spot.other
  json.tag spot.tag.split(',')
  json.title spot.name
  json.status spot.open? ? 'open' : 'closed'
  json.category spot.category.split(',')
  json.expiration_date spot.expiration_date
  json.icon spot.icon
  json.icon_powerframe spot.powerframe_icon
  json.distance spot.distance
end
json.status 'OK'
