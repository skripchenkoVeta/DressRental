# frozen_string_literal: true

# == Schema Information
#
# Table name: salons
#
#  id             :bigint           not null, primary key
#  name           :string
#  address        :text
#  seller_info_id :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Salon < ApplicationRecord
  has_many :products
  has_many :comments, as: :commentable
  belongs_to :seller_info

  validates :name, :address, presence: true
end
