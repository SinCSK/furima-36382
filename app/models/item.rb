class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :item_show, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :day_to_ship_id, presence: true
  validates :price, presence: true

  belongs_to :user
  has_one_attached :image
end
