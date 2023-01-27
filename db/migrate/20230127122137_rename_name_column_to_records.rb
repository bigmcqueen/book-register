class RenameNameColumnToRecords < ActiveRecord::Migration[7.0]
  def change
    rename_column :records, :name, :title
  end
end
