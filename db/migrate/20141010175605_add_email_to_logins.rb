class AddEmailToLogins < ActiveRecord::Migration
  def change
    add_column :logins, :email, :string
  end
end
