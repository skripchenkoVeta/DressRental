class Product < ApplicationRecord
    has_one :type
    belongs_to :salons
    has_many :comments, as: :commentable
    has_many :image, as: :imageable
end
