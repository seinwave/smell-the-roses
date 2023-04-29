class AssociateCategoryWithBreed < ActiveRecord::Migration[7.0]
  def change
    add_reference :breeds, :category, null: false, foreign_key: true
    add_column :breeds, :description, :string
    add_column :breeds, is_deleted, :boolean, default: false, null: false
    add_column :breeds, :category_id, :bigint, null: false
  end
end
