class AddDateDueToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :date_due, :date
  end
end
