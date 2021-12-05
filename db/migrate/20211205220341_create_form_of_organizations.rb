class CreateFormOfOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :form_of_organizations do |t|
t.string :name 
t.integer :seller_id
      t.timestamps
    end
  end
end
