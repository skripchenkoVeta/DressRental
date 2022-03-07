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
  belongs_to :product_type
  belongs_to :salon
  has_many :comments, as: :commentable
  has_many :rentals
  has_many :sizes
  has_one_attached :avatar

  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }, presence: true
  validates :description, length: { minimum: 15 }, presence: true

  def product_type_name
    product_type&.name.present? ? product_type.name : 'None'
  end
end
