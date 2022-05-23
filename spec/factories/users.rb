FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 4) + 'a' + '1' }
    password_confirmation { password }
    last_name             { person.last.kanji }
    first_name            { person.first.kanji }
    last_name_ja          { person.last.katakana }
    first_name_ja         { person.first.katakana }
    birthday              { Faker::Date.backward }
  end
end
