class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :author
      t.date :published_date
      t.integer :user_id

      t.timestamps
    end
  end
end
