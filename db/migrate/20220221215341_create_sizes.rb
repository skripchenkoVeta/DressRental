class CreateSizes < ActiveRecord::Migration[6.1]
  def change
    create_table :sizes do |t|
      t.integer :size
      t.integer :count_size
      t.references :product
      t.timestamps
    end
  end
end
