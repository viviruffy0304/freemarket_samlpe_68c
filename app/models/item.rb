class Item < ApplicationRecord
#  belongs_to user, foreign_key: 'user_id'
# belongs_to :category
    #(中略
  validates :brand, :category, :name, :description, :state, :postage, :region, :shipping_days, :price, presence: true
end