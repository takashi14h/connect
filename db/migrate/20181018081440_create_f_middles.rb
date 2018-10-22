class CreateFMiddles < ActiveRecord::Migration[5.2]
  def change
    create_table :f_middles do |t|
      t.integer :user_id
      t.integer :fashion_id

      t.timestamps
    end
  end
end
