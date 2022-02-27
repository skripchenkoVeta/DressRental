# frozen_string_literal: true

FactoryBot.define do
  factory :comment, class: 'Comment' do
    association :user
    message { 'asdasdada' }
    association :commentable
  end
end
