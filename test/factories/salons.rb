# frozen_string_literal: true

FactoryBot.define do
  factory :salon, class: 'Salon' do
    association :seller_info
    address { Faker::Lorem.characters(number: 15, min_alpha: 15) }
    name { 'public' }
    #   after(:create) do |salon|
    #     create_list(:comment, rand(1..4), commentable: salon)
    #   end
  end
end
