FactoryBot.define do
  factory :item do
    item_name {Faker::Book.title}
    item_show {Faker::Book.author}
    category_id { 2 }
    condition_id { 2 }
    shipping_charge_id { 2 }
    prefecture_id { 2 }
    day_to_ship_id { 2 }
    price { 5000 }
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test_image.png')
    end
  end
end
