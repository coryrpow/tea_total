FactoryBot.define do
  factory :subscription do
    title { Faker::Music::GratefulDead.song }
    price { Faker::Number.decimal(l_digits: 2) }
    status { 0 }
    frequency { Faker::Number.between(from: 1, to: 4) }
  end
end
