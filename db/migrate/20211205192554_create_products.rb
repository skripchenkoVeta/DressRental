# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.references :salon
      t.references :product_type
      t.timestamps
    end
  end
end
