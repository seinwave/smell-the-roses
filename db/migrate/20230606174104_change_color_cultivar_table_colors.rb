class ChangeColorCultivarTableColors < ActiveRecord::Migration[7.0]
  def change
    remove_column :cultivar_colors, :primary_color
    remove_column :cultivar_colors, :accent_color
    add_column :cultivar_colors, :approximate_color, :integer, null: false, default: 0
  end
end
