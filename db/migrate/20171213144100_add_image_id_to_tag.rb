# frozen_string_literal: true

class AddImageIdToTag < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :image_id, :integer
  end
end
