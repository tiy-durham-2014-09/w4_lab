class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user
      t.text :body
      t.references :post, index: true
      # t.integer :user_id
      t.timestamps
    end
  end
end
