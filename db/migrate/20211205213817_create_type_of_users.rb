class CreateTypeOfUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :type_of_users do |t|
t.string :name
t.integer :user_id
      t.timestamps
    end
  end
end
