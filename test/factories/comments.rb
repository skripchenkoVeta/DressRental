# frozen_string_literal: true

FactoryBot.define do
  factory :comment, class: 'Comment' do
    association :user
    association :commentable
    message { Faker::Hipster.sentence }
  end
end
