FactoryBot.define do
  factory :total_info do
    date { Faker::Date.backward }
    hospital_name { Faker::Name.name }

    # medications 属性を設定
    transient do
      medication_count { 1 } # デフォルトのメディケーション数
    end

    after(:build) do |total_info, evaluator|
      total_info.medications = build_list(:medication_info, evaluator.medication_count)
    end
  end

  factory :medication_info, class: 'Medication' do
    medicine_name { Faker::Name.name }
    timing { Faker::Lorem.characters(number: 3) }
    individual { Faker::Number.between(from: 5, to: 11) }
    days_supply { Faker::Number.between(from: 5, to: 11) }
    notes { Faker::Lorem.sentence }
  end
end
