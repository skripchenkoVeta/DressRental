class AddFreezeToBuyerInfos < ActiveRecord::Migration[6.1]
  def change
    add_column :buyer_infos, :freeze, :boolean
  end
end
