FactoryBot.define do
    factory :order do
        device_model { Faker::Lorem.sentence(3, false) }
        imei { Faker::Number.number(15) }
        annual_price { Faker::Number.decimal(3,2) }
        installment_no { Faker::Number.number(2) }
        user_id nil
    end
  end