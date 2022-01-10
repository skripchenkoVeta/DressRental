class CreateRentals < ActiveRecord::Migration[6.1]
  def change
    create_table :rentals do |t|
      t.datetime :start_rent
      t.datetime :end_rent
      t.boolean :status
      t.boolean :approve
      t.references :buyer_info
      t.references :product

      t.timestamps
    end
  end
end
