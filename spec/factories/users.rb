FactoryBot.define do
    factory :user do
      cpf { Faker::Number.number(11) }
      name { Faker::Name.name}
      email { Faker::Internet.email}
    end
  end