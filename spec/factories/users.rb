FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {'こん'}
    first_name {'こん'}
    kana_last_name {'コン'}
    kana_first_name {'コン'}
    postcode {'816-0823'}
    prefecture_id {2}
    city { '福岡市' }
    house_number { '1-1' }
    building { 'こんハイツ' }
    phone { '09012345678' }
    birthday {Faker::Date.birthday}
  end
end