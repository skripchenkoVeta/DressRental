class Product < ApplicationRecord
    has_one :type
    belongs_to :salons
    has_many :comments, as: :commentable
    has_many :image, as: :imageable

    validates :name, presence: true
    validates :price, numericality: { greater_than: 0}, presence: true
    validates :description, length: { minimum: 15 }, presence: true
end
