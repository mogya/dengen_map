class AddImageIdToTag < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :image_id, :integer
  end
end
