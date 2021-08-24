class PurchaseForm
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :address, :building, :phone_number, :prefecture_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :token

    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/, message: ". Input only number"}
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, city: city, address: address, building: building, phone_number: phone_number, prefecture_id: prefecture_id,purchase_id: purchase.id)
  end
end