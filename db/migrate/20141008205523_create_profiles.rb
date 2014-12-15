class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :bio
      t.string :location
      t.string :website

      t.timestamps
    end
  end
end
