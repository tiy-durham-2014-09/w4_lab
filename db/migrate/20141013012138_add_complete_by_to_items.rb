class AddCompleteByToItems < ActiveRecord::Migration
  def change
    add_column :items, :completed_by, :datetime
  end
end
