# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :number
      t.string :password
      t.string :role
      t.references :profileable, polymorphic: true

      t.timestamps
    end
  end
end
