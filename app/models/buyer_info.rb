# frozen_string_literal: true

class BuyerInfo < ApplicationRecord
  has_one :user, as: :profileable # check to work

  validates :birthday, presence: true
end
