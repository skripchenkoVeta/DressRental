# frozen_string_literal: true

class CreateSalons < ActiveRecord::Migration[6.1]
  def change
    create_table :salons do |t|
      t.string :name
      t.text :address
      t.references :seller_info
      
      t.timestamps
    end
  end
end
