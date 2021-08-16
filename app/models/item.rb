class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :day_to_ship
  
  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_show
  end

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :day_to_ship_id
  end

  validates :price, presence: true, numericality: { 
    greater_than_or_equal_to: 300 , less_than_or_equal_to: 9_999_999 , message: "is out of setting range" 
  }

end
