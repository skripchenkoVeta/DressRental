class Salon < ApplicationRecord
    has_many :products
    has_many :comments, as: :commentable
    has_one :image, as: :imageable
end
