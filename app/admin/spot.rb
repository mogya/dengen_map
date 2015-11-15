ActiveAdmin.register Spot do
  permit_params(
    :name, :status, :address, :tel, :lat, :lng, :latitude, :longitude,
    links_attributes:[ :id, :url, :link_type, :_destroy ],
    spot_infos_attributes:[ :id, :type, :value, :detail, :_destroy ]
  )
  index do
    column :id
    column :name do |spot|
      link_to spot.name, aa_spot_path(spot)
    end
    column :status
    column :address
    column :tel
    column :latlng_str
    column :updated_at
  end
  filter :name
  filter :address
  filter :tel
  filter :created_at
  filter :updated_at

  show do |spot|
    attributes_table do
      rows :id, :name, :status, :address, :tel
      row "latlng" do
        spot.latlng_str
      end
      rows :updated_at
      table_for spot.links do
        column "links" do |link|
          link_to("#{truncate(link.url, length:120)}", aa_link_path(link)) + " (#{link.link_type})"
        end
      end
      table_for spot.tags do
        column "tags" do |tag|
          link_to(tag.name, aa_tag_path(tag)) + " (#{tag.tag_type})"
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Spot" do
      f.input :name
      f.input :status, as: :select, collection: Spot.statuses.keys, default:Spot.statuses.keys.first, include_blank:false
      f.input :address, input_html: { rows:2 }
      f.input :tel
      f.input :latitude, as: :number
      f.input :longitude, as: :number

      f.has_many :links, heading: 'Links', allow_destroy: true, new_record: true do |f_link|
        f_link.input :url
        f_link.input :link_type, aa_enum_select(:link, :link_types)
      end
      f.has_many :spot_infos, heading: 'Lnfo', allow_destroy: true, new_record: true do |f_info|
        f_info.input :type, aa_subclass_select(:spot_info)
        f_info.input :value
        f_info.input :detail
      end
      f.has_many :spot_tags, heading: 'Tag', allow_destroy: false, new_record: false do |f_tag|
        f_tag.input :tag, as: :check_boxes, :collection => Tag.all.map{ |tag|  [tag.to_s, tag.id] }
      end
    end
    f.actions
  end
end
