class CreateModels < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :name
      t.integer :status, null: false, index: true, default: 0
      t.text :address
      t.string :tel
      t.integer :lat, index: true
      t.integer :lng, index: true
      t.integer :powersupply_score, default: 0, index: true
      t.integer :ee_id
      t.integer :ee_url_title

      t.timestamps null: false
    end

    create_table :tags do |t|
      t.string :name
      t.string :type, index: true
      t.string :image
      t.integer :sprite_pos
      t.text :detail
      t.integer :importance, index: true, default:0
      t.integer :parent_id, index: true

      t.timestamps null: false
    end

    create_table :spots_tags, id: false do |t|
      t.references :spot, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
    end

    create_table :links do |t|
      t.string :url
      t.integer :link_type, null: false, index: true, default: 0
      t.references :spot, index: true, foreign_key: true

      t.timestamps null: false
    end

    create_table :spot_infos do |t|
      t.string :type, index: true
      t.integer :value, index: true
      t.text :detail
      t.boolean :official
      t.references :spot, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
