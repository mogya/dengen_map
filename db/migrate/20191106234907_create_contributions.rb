class CreateContributions < ActiveRecord::Migration[5.0]
  def change
    create_table :contributions do |t|
      t.integer :category, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.text :context, null: false, default: ''
      t.integer :spot_id, null: false
      # possibly user_id=nil since we don't have user registration at this time.
      t.integer :user_id, null: true
      t.string :name
      t.string :email
      t.string :ip_address

      t.timestamps
    end
    add_index :contributions, :category
    add_index :contributions, :status
    add_index :contributions, :spot_id
    add_index :contributions, :user_id
  end
end
