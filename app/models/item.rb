class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :item_show, precence: true
  validates :category_id, precence: true
  validates :condition_id, precence: true
  validates :shipping_charge_id, precence: true
  validates :prefecture_id, precence: true
  validates :day_to_ship_id, precence: true
  validates :price, precence: true

  belongs_to :user
end
