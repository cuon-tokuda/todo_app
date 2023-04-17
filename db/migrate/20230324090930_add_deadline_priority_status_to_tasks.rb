class AddDeadlinePriorityStatusToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :deadline, :datetime, null: false
    add_column :tasks, :priority, :string, null: false
    add_column :tasks, :status, :integer, null: false, default: 0
  end
end
