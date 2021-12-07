# frozen_string_literal: true

class CreateBuyerInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :buyer_infos do |t|
      t.date :birthday
      t.string :address
      
      t.timestamps
    end
  end
end
