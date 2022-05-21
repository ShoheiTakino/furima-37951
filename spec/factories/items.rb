FactoryBot.define do
  factory :item do
    image                {}
    name                 {Faker::Name.name}
    content              {Faker::Internet.free_email}
    category_id          {Faker::Internet.password(min_length: 4)+ "a" + "1"} 
    status_id            {password}
    shipfee_id           {person.last.kanji}
    province_id          {person.first.kanji}
    shipping_id          {person.last.katakana}
    price                {person.first.katakana}
  end
end
