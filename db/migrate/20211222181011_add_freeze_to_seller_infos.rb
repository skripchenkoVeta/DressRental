class AddFreezeToSellerInfos < ActiveRecord::Migration[6.1]
  def change
    add_column :seller_infos, :freeze, :boolean
  end
end
