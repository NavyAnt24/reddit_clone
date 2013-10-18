class AddEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string, unique: true
    add_index :users, :email
  end
end
