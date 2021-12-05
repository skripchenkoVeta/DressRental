class SellerInfo < ApplicationRecord
    has_one :form_of_organizations
    has_one :user, as: :profileable
end
