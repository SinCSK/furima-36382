FactoryBot.define do
  factory :purchase_form do
    card_number {"424242424242"}
    card_exp_month {"3"}
    card_exp_year {"23"}
    card_cvc {"123"}
    postal_code {"222-2222"}
    city {"テストシティ"}
    address {"テスト1-2-3"}
    building {"テストビル"}
    phone_number {"09000001111"}
    prefecture_id { 2 }

    association :user 
    association :item
  end
end