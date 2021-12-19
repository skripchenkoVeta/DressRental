# frozen_string_literal: true

# == Schema Information
#
# Table name: seller_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SellerType < ApplicationRecord
  has_many :seller_infos
end
