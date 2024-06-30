FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end

  factory :lab_report do
    association :user
    title { Faker::Lorem.sentence(word_count: 4) }
    description { Faker::Lorem.paragraph_by_chars(number: 500, supplemental: false) }
    grade { %w[A B C D E FX F].sample }
  end
end