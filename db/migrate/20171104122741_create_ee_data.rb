# frozen_string_literal: true

class CreateEeData < ActiveRecord::Migration[5.0]
  def change
    create_table :ee_data do |t|
      t.references :spot, index: true
      t.string :title
      t.string :url_title
      t.string :address
      t.string :tel
      t.float :latitude
      t.float :longitude
      t.string :url_pc
      t.string :url_mobile
      t.string :wireless
      t.string :powersupply
      t.string :tag
      t.string :category
      t.text :other
      t.text :images
      t.text :reference_urls
      t.text :private_data
      t.string :status
      t.timestamp :ee_update_at
      t.timestamp :expiration_date

      t.timestamps
    end

    add_reference :spots, :ee, index: true
  end
end
