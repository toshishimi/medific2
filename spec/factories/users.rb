FactoryBot.define do
  factory :user do

    transient do
      person { Gimei.name }
    end

    name                  {person.last.kanji }
    name_kana             {person.last.katakana}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birth_date            {Faker::Date.backward}
    
  end
end