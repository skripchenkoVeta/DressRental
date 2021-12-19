# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id              :bigint           not null, primary key
#  name            :string
#  description     :text
#  price           :float
#  salon_id        :bigint
#  product_type_id :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Product < ApplicationRecord
  has_one :product_type
  belongs_to :salon
  has_many :comments, as: :commentable

  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }, presence: true
  validates :description, length: { minimum: 15 }, presence: true
end
