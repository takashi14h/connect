class CreateCatalogs < ActiveRecord::Migration[5.2]
  def change
    create_table :catalogs do |t|
      t.integer :user_id
      t.string :before_front_image_id
      t.string :before_side_image_id
      t.string :before_back_image_id
      t.string :order_front_image_id
      t.string :order_side_image_id
      t.string :order_back_image_id
      t.string :after_front_image_id
      t.string :after_side_image_id
      t.string :after_back_image_id
      t.string :salon
      t.string :stylist
      t.string :menu
      t.string :price
      t.string :length
      t.string :color
      t.string :goods
      t.text :comment
      t.string :address
      t.float :latitude
      t.float :longitude
      t.datetime :deleted_at
      t.integer :impressions_count, default: 0

      t.timestamps
    end
  end
end
