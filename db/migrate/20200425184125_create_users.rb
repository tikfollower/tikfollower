class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :tiktok_username
      t.integer :total_count_stars

      t.timestamps
    end
    add_index :users, :tiktok_username, unique: true
  end
end
