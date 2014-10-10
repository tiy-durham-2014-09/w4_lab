class RemoveCompleteFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :complete?, :boolean
  end
end
