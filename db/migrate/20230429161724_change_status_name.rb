class ChangeStatusName < ActiveRecord::Migration[7.0]
  def change
    rename_table :rose_statuses, :statuses
  end
end
