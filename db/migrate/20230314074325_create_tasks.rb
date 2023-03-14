class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.datetime :deadline, null: false
      t.string :priority, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
