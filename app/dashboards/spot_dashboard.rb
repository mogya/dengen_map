require "administrate/base_dashboard"

class SpotDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    links: Field::HasMany,
    spot_infos: Field::HasMany,
    smoke_infos: Field::HasMany.with_options(class_name: "SpotInfo::Smoke"),
    powersupply_infos: Field::HasMany.with_options(class_name: "SpotInfo::Powersupply"),
    business_hour_infos: Field::HasMany.with_options(class_name: "SpotInfo::BusinessHour"),
    dayoff_infos: Field::HasMany.with_options(class_name: "SpotInfo::Dayoff"),
    # spots_tags: Field::HasMany,
    tags: Field::HasMany,
    wifi_tags: Field::HasMany.with_options(class_name: "Tag::Wifi"),
    other_tags: Field::HasMany.with_options(class_name: "Tag::Other"),
    category_tags: Field::HasMany.with_options(class_name: "Tag::Category"),
    id: Field::Number,
    name: Field::String,
    status: Field::Number,
    address: Field::Text,
    tel: Field::String,
    lat: Field::Number,
    lng: Field::Number,
    powersupply_score: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :links,
    :spot_infos,
    :smoke_infos,
    :powersupply_infos,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :links,
    :spot_infos,
    :smoke_infos,
    :powersupply_infos,
    :business_hour_infos,
    :dayoff_infos,
    # :spots_tags,
    :tags,
    :wifi_tags,
    :other_tags,
    :category_tags,
    :name,
    :status,
    :address,
    :tel,
    :lat,
    :lng,
    :powersupply_score,
  ]
end
