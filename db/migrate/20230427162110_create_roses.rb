class CreateRoses < ActiveRecord::Migration[7.0]
  def change
    create_table :roses do |t|
      t.text :name
      t.uuid :species_id
      t.uuid :variety_id
      t.text :primary_color
      t.text :accent_color
      t.float :location_x
      t.float :location_y
      t.date :acquired_date
      t.boolean :is_deleted

      t.timestamps
    end
    add_index :roses, :name, unique: true
    add_index :roses, :species_id
    add_index :roses, :variety_id
  end
end
