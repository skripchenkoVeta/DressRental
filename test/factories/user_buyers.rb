# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'asd' }
    surname { Faker::Name.last_name }
    number { Faker::PhoneNumber.unique.cell_phone }
    email { Faker::Internet.email }
    role { 'Buyer' }
    password { '1234567' }
  end
end
