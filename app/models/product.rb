# frozen_string_literal: true

class Product < ApplicationRecord
  has_one :product_type 
  belongs_to :salon
  has_many :comments, as: :commentable

  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }, presence: true
  validates :description, length: { minimum: 15 }, presence: true
  
end
