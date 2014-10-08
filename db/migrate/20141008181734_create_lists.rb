class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.belongs_to :user

      t.timestamps
    end
  end
end
