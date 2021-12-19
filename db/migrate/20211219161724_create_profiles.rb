class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :profileable, polymorphic: true
      
      t.timestamps
    end
  end
end
