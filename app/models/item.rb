class Item < ApplicationRecord
#  belongs_to user, foreign_key: 'user_id'
# belongs_to :category
    #(中略
  validates :brand, :category, :name, :description, :state, :postage, :region, :shipping_days, :price, presence: true
  validates :category, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :state, presence: true
  validates :postage, presence: true
  validates :region, presence: true
  validates :shipping_days, presence: true
  validates :price, presence: true
end