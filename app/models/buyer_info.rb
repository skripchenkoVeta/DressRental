# frozen_string_literal: true

class BuyerInfo < ApplicationRecord
  has_one :user, as: :profileable 

  validates :birthday, presence: true
end
