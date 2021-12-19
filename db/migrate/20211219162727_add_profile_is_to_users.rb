class AddProfileIsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :profile, null: true, foreign_key: true
  end
end
