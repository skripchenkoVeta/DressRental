# frozen_string_literal: true

class SellerType < ApplicationRecord
  has_many :seller_infos
end
