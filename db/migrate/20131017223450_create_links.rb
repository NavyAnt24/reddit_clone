class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title, :null => false
      t.string :url, :null => false
      t.string :body
      t.integer :user_id

      t.timestamps
    end

    add_index :links, :url
    add_index :links, :user_id

  end
end
