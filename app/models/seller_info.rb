class SellerInfo < ApplicationRecord
    has_one :form_of_organizations
    has_one :user, as: :profileable

    validates :kpp,:unp, numericality: true , presence: true, length: { is: 9 }
    validates :name,:supplier_name, presence: true
end
