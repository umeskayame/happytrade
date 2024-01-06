FactoryBot.define do
  factory :item do
    item_name              {Faker::Name.initials(number: 2)}
    description                 {'あああああ'}
    category_id              {'2'}
    status_id {'2'}
    prefecture_id {'30'}
    shipping_day_id {'2'}
    wanted_item {'秘密'}
    association :user
  

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end