class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
t.string :name
t.string :surname
t.string :email
t.integer :number
t.string :password
      t.timestamps
    end
  end
end
