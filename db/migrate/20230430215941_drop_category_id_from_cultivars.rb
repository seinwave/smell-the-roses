class DropCategoryIdFromCultivars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cultivars, :category_id, :int
  end
end
