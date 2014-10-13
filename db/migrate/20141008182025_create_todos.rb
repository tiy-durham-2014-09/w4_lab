class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :item
      t.text :note
      t.date :date
      t.boolean :complete
      t.belongs_to :list

      t.timestamps
    end
  end
end
