# frozen_string_literal: true

class SellerInfo < ApplicationRecord
  has_one :seller_type
  has_one :user, as: :profileable
  has_many :salons
  
  validates :kpp, :unp, numericality: true, presence: true
  validates :supplier_name, presence: true
  
end
