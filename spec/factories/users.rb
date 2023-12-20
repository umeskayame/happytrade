FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@test.com'}
    password              {'a11111'}
    password_confirmation {password}
    last_name {'こん'}
    first_name {'こん'}
    kana_last_name {'コン'}
    kana_first_name {'コン'}
    birthday {'1994-08-11'}
  end
end