ActiveAdmin.register Tag::Other do
  permit_params :name, :importance, :image, :sprite_pos, :type, :detail, :parent_id
  config.sort_order = 'parent_id_asc'
  config.per_page = 80
  index as: :table do
    column :name do |tag|
      link_to tag.name, aa_tag_category_path(tag)
    end
    column :type
    column :importance
    column :sprite_pos
    column :parent
  end

  filter :image
  filter :detail
  filter :parent, as: :check_boxes, collection: proc { Tag::Other.order(:parent_id, :importance) }
  filter :updated_at

  show do |tag|
    attributes_table do
      rows :id, :name, :image, :sprite_pos, :detail, :importance, :parent, :type, :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.input :name
    f.input :importance
    f.input :image
    f.input :sprite_pos
    f.input :detail, input_html: { rows:2 }
    f.input :parent
    f.input :type, aa_subclass_select(:tag)
    f.actions
  end
end
