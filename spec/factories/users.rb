FactoryBot.define do
  factory :user do

    transient do
      person { Gimei.name }
    end

    name                  {person.last.kanji }
    name_kana             {person.last.katakana}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    birth_date            {Faker::Date.backward}
    
  end
end