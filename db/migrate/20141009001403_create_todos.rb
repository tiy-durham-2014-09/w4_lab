class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name
      t.text :note
      t.date :due_date
      t.boolean :done

      t.timestamps
    end
  end
end
