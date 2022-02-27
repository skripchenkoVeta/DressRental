# frozen_string_literal: true

FactoryBot.define do
  factory :rental, class: 'Rental' do
    association :size
    association :buyer_info
    association :product
    start_rent { Faker::Date.between(from: Date.today + 4, to: Date.today + 7) }
    end_rent { Faker::Date.between(from: Date.today + 7, to: Date.today + 30) }
    approve { false }
    status { false }

    trait :active do
      approve { true }
      status { true }
    end
    trait :ended do
      approve { true }
      status { false }
    end
  end
end
