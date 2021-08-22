class PurchaseForm
  include ActiveModel::Model
  attr_accessor :card_number, :card_exp_month, :card_exp_year, :card_cvc,
                :postal_code, :city, :address, :building, :phone_number, :prefecture_id, :user_id, :item_id

  with_options presence: true do
    validates :card_number
    validates :card_exp_month
    validates :card_exp_year
    validates :card_cvc

    validates :postal_code
    validates :city
    validates :address
    validates :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, city: city, address: address, building: building, phone_number: phone_number, prefecture_id: prefecture_id,purchase_id: purchase.id)
  end
end