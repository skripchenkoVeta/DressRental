# frozen_string_literal: true

FactoryBot.define do
  factory :salon, class: 'Salon' do
    association :seller_info
    address { Faker::Address.full_address }
    name { Faker::Company.name }
  end
end
