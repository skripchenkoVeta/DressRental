# frozen_string_literal: true

FactoryBot.define do
  factory :product, class: 'Product' do
    association :salon
    association :product_type
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    description { Faker::Hipster.paragraph }
    name { Faker::Lorem.sentence(word_count: 3) }
  end
end
