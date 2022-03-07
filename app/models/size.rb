class Size < ApplicationRecord
    has_many :rentals
    belongs_to :product
end
