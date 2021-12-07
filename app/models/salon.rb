# frozen_string_literal: true

class Salon < ApplicationRecord
  has_many :products
  has_many :comments, as: :commentable

  validates :name, :address, presence: true
end
