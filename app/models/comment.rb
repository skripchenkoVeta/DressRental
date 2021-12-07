class Comment < ApplicationRecord
 belongs_to :commentable, polymorphic: true #нужен метод
end
