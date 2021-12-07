# frozen_string_literal: true

class CreateSellerTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :seller_types do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
