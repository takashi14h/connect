class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :catalog_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
