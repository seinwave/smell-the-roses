class AddHslValueToCultivarColorTable < ActiveRecord::Migration[7.0]
  def change
    add_column :cultivar_colors, :hsl_value, :string
  end
end
