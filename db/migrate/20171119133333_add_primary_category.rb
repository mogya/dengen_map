# frozen_string_literal: true

class AddPrimaryCategory < ActiveRecord::Migration[5.0]
  def change
    add_reference :spots, :prime_category, index: false
    add_index :tags, :name
  end
end
