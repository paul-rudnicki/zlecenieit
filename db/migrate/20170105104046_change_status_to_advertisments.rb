class ChangeStatusToAdvertisments < ActiveRecord::Migration[5.0]
  def change
  	change_column :advertisments, :status, false
  end
end
