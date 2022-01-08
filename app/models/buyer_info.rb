# frozen_string_literal: true

# == Schema Information
#
# Table name: buyer_infos
#
#  id         :bigint           not null, primary key
#  birthday   :date
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class BuyerInfo < ApplicationRecord
  has_one :user, as: :profileable
  has_many :rentals
  has_one_attached :avatar
  
  validates :birthday, presence: true
end
