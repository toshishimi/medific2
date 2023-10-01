FactoryBot.define do
  factory :total_info do
    date            {Faker::Date.backward}
    hospital_name   {Faker::Name.name}
    medicine_name   {Faker::Name.name}
    timing          {Faker::Lorem.characters(number:3)}
    individual      {Faker::Number.between(from: 5, to: 11)}
    days_supply     {Faker::Number.between(from: 5, to: 11)}
    notes           {Faker::Lorem.sentence}
  end
end
