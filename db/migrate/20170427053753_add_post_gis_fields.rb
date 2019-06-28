# frozen_string_literal: true

class AddPostGisFields < ActiveRecord::Migration[5.0]
  def change
    add_column :spots, :lonlat, :st_point, srid: 4326
    remove_column :spots, :lat, :integer
    remove_column :spots, :lng, :integer
    add_index :spots, :lonlat, using: :gist
  end
end
