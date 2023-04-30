class ChangeBreedToCultivar < ActiveRecord::Migration[7.0]
  def change
    remove_column :plants, :breed_id, :int
    add_reference :plants, :cultivar, null: false, foreign_key: true
  end
end
