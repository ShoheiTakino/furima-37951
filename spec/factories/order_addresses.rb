FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    province_id       { 2 }
    city              { '大阪市' }
    address1          { '1-1' }
    address2          { '大阪ハイツ' }
    phone             { 1_234_567_890 }
    token             { 'tok_abcdefghijk00000000000000000' }
  end
end
