FactoryBot.define do
  factory :item do
   product_name     { "商品名" }
   explanation      { "商品の説明" }
   category_id      { 2 }
   state_id         { 2 }
   fee_id           { 2 }
   prefecture_id    { 2 }
   day_id           { 2 }
   selling_price    { 100000 }
   association :user

   after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
   end
  end
end
