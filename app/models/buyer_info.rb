class BuyerInfo < ApplicationRecord
    has_one :user, as: :profileable
    has_one :image, as: :imageable
end
