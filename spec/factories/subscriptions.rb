FactoryBot.define do
  factory :subscription do
    title { Faker::Music::GratefulDead.song }
    price { Faker::Number.decimal(l_digits: 2) }
    status { Faker::Number.betwee(from: 0, to: 1) }
    frequency { Faker::Number.between(from: 1, to: 4) }
    customer { nil }
  end
end
