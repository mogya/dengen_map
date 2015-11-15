ActiveAdmin.register Link do
  permit_params :url, :link_type, :spot_id
  index do
    column :url do |link|
      link_to truncate(link.url, length:50), aa_link_path(link)
    end
    column :link_type
    column :spot
  end
  filter :url
  filter :link_type
  filter :created_at
  filter :updated_at

  form do |f|
    f.input :url
    f.input :link_type, aa_enum_select(:link, :link_types)
    f.input :spot
    f.actions
  end
end
