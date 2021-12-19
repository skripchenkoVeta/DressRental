# frozen_string_literal: true

# == Schema Information
#
# Table name: seller_infos
#
#  id             :bigint           not null, primary key
#  unp            :integer
#  kpp            :integer
#  supplier_name  :string
#  seller_type_id :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class SellerInfo < ApplicationRecord
  has_one :seller_type
  has_one :user, as: :profileable
  has_many :salons
  
  validates :kpp, :unp, numericality: true, presence: true
  validates :supplier_name, presence: true
  
end
