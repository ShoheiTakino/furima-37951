FactoryBot.define do
  factory :item do
    association :user

    name                 { Faker::Name.name }
    content              { 2 }
    category_id          { 2 }
    status_id            { 2 }
    shipfee_id           { 2 }
    province_id          { 2 }
    shipping_id          { 2 }
    price                { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
