class Rental < ApplicationRecord
  belongs_to :buyer_info
  belongs_to :product
  belongs_to :size
end
