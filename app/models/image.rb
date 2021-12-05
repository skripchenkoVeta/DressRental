class Image < ApplicationRecord
  has_one_attached :picture
  belongs_to :imageable, polymorphic: true
end
