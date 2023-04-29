class ChangeDatesToYears < ActiveRecord::Migration[7.0]
  def change
    change_column :breeds, :bred_date, :integer
    change_column :breeds, :introduced_date, :integer
    rename_column :breeds, :bred_date, :bred_year
    rename_column :breeds, :introduced_date, :introduced_year
  end
end
