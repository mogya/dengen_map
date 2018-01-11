json.categories @categories do |tag|
  json.id tag.id
  json.name tag.name
  json.type tag.type
  json.image tag.image
  json.sprite_pos tag.sprite_pos
  json.detail tag.detail
  json.importance tag.importance
  json.parent_id tag.parent_id
  json.created_at tag.created_at
  json.updated_at tag.updated_at
  json.image_id tag.image_id
end

json.wifi @wifi do |tag|
  json.id tag.id
  json.name tag.name
  json.type tag.type
  json.image tag.image
  json.sprite_pos tag.sprite_pos
  json.detail tag.detail
  json.importance tag.importance
  json.parent_id tag.parent_id
  json.created_at tag.created_at
  json.updated_at tag.updated_at
  json.image_id tag.image_id
end

json.others @others do |tag|
  json.id tag.id
  json.name tag.name
  json.type tag.type
  json.image tag.image
  json.sprite_pos tag.sprite_pos
  json.detail tag.detail
  json.importance tag.importance
  json.parent_id tag.parent_id
  json.created_at tag.created_at
  json.updated_at tag.updated_at
  json.image_id tag.image_id
end
