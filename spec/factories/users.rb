FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name { '全角' }
    last_name { '全角' }
    k_first { 'テスト' }
    k_last { 'テスト' }
    birthday { 19_920_816 }
  end
end
