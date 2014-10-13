class AddOverDueToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :overdue?, :boolean, null: false, default: false
  end
end
