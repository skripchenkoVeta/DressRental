class Rental < ApplicationRecord
    belongs_to :buyer_info
    belongs_to :product
end
