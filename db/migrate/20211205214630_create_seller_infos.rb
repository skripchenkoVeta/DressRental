# frozen_string_literal: true

class CreateSellerInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :seller_infos do |t|
      t.integer :unp
      t.integer :kpp
      t.string :supplier_name
      t.references :seller_type
      
      t.timestamps
    end
  end
end
