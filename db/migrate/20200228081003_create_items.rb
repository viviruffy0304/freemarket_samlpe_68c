class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :user_id, foreign_key: true
      t.integer :seller_id, foreign_key: true
      t.integer :buyer_id, foreign_key: true
      t.integer :brand_id, foreign_key: true
      t.integer :category_id, foreign_key: true
      t.string :name, null: false
      t.text :description, null: false
      t.text :state, null: false
      t.string :postaget, null: false
      t.string :region, null: false
      t.string :shipping_days, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
