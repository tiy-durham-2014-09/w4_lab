class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :list, index: true
      t.string :title
      t.text :description
      t.date :due_date

      t.timestamps
    end
  end
end
