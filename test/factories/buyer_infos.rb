# frozen_string_literal: true

FactoryBot.define do
  factory :buyer_info do
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    address { Faker::Address.street_address }

    after(:create) do |buyer_info|
      create(:user, profileable: buyer_info)
    end
  end
end
