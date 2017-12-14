json.results @spots do |spot|
  json.id spot.ee_id
  json.title spot.name
  json.address spot.address
  json.tel spot.tel
  json.latitude spot.latitude
  json.longitude spot.longitude
  json.url spot.url_pc
  json.other spot.other
  json.distance spot.distance
  json.status spot.open? ? 'open' : 'closed'
  json.expiration_date spot.expiration_date
  json.mo_url spot.mo_url
  json.wireless spot.wireless_tags do |tag|
    json.name tag.name
    json.image tag.image_path
    json.image_id tag.image_id
    json.sprite_pos tag.sprite_pos
    json.importance tag.importance
    json.parent_id tag.parent_id
  end
  json.categories spot.category_tags do |tag|
    json.name tag.name
    json.image tag.image_path
    json.image_id tag.image_id
    json.sprite_pos tag.sprite_pos
    json.importance tag.importance
    json.parent_id tag.parent_id
  end
  json.tags spot.other_tags do |tag|
    json.name tag.name
    json.image tag.image_path
    json.image_id tag.image_id
    json.sprite_pos tag.sprite_pos
    json.importance tag.importance
    json.parent_id tag.parent_id
  end
  json.prime_category {
    json.name spot.prime_category.name
    json.image spot.prime_category.image_path
    json.image_id spot.prime_category.image_id
    json.sprite_pos spot.prime_category.sprite_pos
    json.importance spot.prime_category.importance
    json.parent_id spot.prime_category.parent_id
  }
  json.icon spot.icon
end
json.status 'OK'
