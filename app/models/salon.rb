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
  has_many :products,  dependent: :delete_all
  has_many :comments, as: :commentable,  dependent: :delete_all
  belongs_to :seller_info
  has_one_attached :picture

  validates :name, :address, presence: true
end
