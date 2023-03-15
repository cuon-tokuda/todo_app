class RemoveColumnsFromTask < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :deadline, :string
    remove_column :tasks, :priority, :string
    remove_column :tasks, :status, :string
  end
end
