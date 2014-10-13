class AddListToTodos < ActiveRecord::Migration
  def change
    add_reference :todos, :list, index: true

  end
end
