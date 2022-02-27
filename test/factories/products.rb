# frozen_string_literal: true

FactoryBot.define do
  factory :product, class: 'Product' do
    association :salon
    association :product_type
    price { 100 }
    description { Faker::Lorem.characters(number: 15, min_alpha: 15) }
    name { 'public' }
    # after(:create) do |product|
    #   create_list(:comment, rand(1..4), commentable: product)
    # end
  end
end
