FactoryBot.define do
  factory :address do

    association :order

    postal_code       { '123-4567' }
    province_id       { 2 }
    city              { '大阪市' }
    address1          { '1-1' }
    address2          { '大阪ハイツ' }
    phone             { 1234567890 }
  end
end
