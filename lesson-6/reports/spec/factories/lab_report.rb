require 'ffaker'

FactoryBot.define do
    factory :lab_report do
      title { FFaker::Lorem.sentence }
      description { FFaker::Lorem.paragraph }
      grade { %w[A B C D E FX F].sample }
      user
    end
  end