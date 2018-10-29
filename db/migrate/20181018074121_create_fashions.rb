class CreateFashions < ActiveRecord::Migration[5.2]
  def change
    create_table :fashions do |t|
      t.string :fashion_name
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
