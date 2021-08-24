FactoryBot.define do
  factory :purchase_form do
    token {"tok_a5508b86f887462bf3184e17aea7"}
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