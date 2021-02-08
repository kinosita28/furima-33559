FactoryBot.define do
  factory :buy do
    user_id         { 1 }
    item_id         { 1 }
    postal_code     {"111-1111"}
    prefecture_id   {2}
    municipality    {"全角"}
    address         {"テスト"}
    building        {"テスト"}
    phone_number    {"11111111111"}
  end
end