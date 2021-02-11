FactoryBot.define do
  factory :buy do
    postal_code     {"111-1111"}
    prefecture_id   {2}
    municipality    {"全角"}
    address         {"テスト"}
    building        {"テスト"}
    phone_number    {"11111111111"}
    token           {"tok_abcdefghijk00000000000000000"}
  end
end