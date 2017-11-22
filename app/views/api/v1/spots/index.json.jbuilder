json.results @spots do |spot|
  json.id spot.ee_id
  json.title spot.name
  json.address spot.address
  json.tel spot.tel
  json.latitude spot.latitude
  json.longitude spot.longitude
  json.url spot.url_pc
  json.wireless spot.wireless.split(',')
  json.categories spot.category.split(',')
  json.tags spot.tag.split(',')
  json.other spot.other
  json.distance spot.distance
  json.status spot.open? ? 'open' : 'closed'
  json.expiration_date spot.expiration_date
  json.mo_url spot.mo_url
  json.prime_category {
    json.id spot.prime_category.id
    json.name spot.prime_category.name
    json.image spot.prime_category.image_path
    json.sprite_pos spot.prime_category.sprite_pos
    json.importance spot.prime_category.importance
    json.parent_id spot.prime_category.parent_id
  }
  json.icon spot.icon
  # json.icon_powerframe spot.powerframe_icon
end
json.status 'OK'
