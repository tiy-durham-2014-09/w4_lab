class RemoveOverdueFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :overdue?, :boolean
  end
end
