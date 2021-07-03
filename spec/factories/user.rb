FactoryBot.define do

  factory :user do

    name { '鈴木一郎' }
    name_kana { 'スズキイチロウ' }
    sequence(:nick_name) { |n| "test_nick_name_#{n}" }
    gender { 1 }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password' }
    suspended { false }

  end

end
