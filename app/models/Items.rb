class Item < ApplicationRecord
  belongs_to user, foreign_key: 'user_id'
  belongs_to :category
    #(中略
end