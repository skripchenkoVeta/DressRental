class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description 
      t.float :price
      t.integer :salon_id
      t.timestamps
    end
  end
end
