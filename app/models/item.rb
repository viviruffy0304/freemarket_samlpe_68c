class Item < ApplicationRecord


    belongs_to :seller, class_name: "User"
    belongs_to :buyer, class_name: "User"
    has_many :images, dependent: :destroy
    accepts_nested_attributes_for :images

    validates :seller_id,     presence: true
    validates :category,   presence: true
    validates :name,          presence: true
    validates :description,   presence: true
    validates :state,         presence: true
    validates :postage,       presence: true
    validates :region,        presence: true
    validates :shipping_days, presence: true
    validates :price,         presence: true

end
