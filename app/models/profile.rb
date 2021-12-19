class Profile < ApplicationRecord
    has_one :user
    belongs_to :profileable, polymorphic: true

end
