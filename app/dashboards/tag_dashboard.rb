require "administrate/base_dashboard"

class TagDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    spots_tags: Field::HasMany,
    spots: Field::HasMany,
    parent: Field::HasOne,
    id: Field::Number,
    name: Field::String,
    type: Field::String,
    image: Field::String,
    detail: Field::Text,
    importance: Field::Number,
    parent_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :spots_tags,
    :spots,
    :parent,
    :id,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :spots_tags,
    :spots,
    :parent,
    :name,
    :type,
    :image,
    :detail,
    :importance,
    :parent_id,
  ]
end
