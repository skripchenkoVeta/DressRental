class User < ApplicationRecord
    has_one :type_of_user
    belongs_to :profileable, polymorphic: true, optional: -> { admin? }
end
