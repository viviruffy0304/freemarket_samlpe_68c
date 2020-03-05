class Item < ApplicationRecord

# belongs_to :category
    #(中略
  validates :seller_id, :brand, :category, :name, :description, :state, :postage, :region, :shipping_days, :price, presence: true

 
end