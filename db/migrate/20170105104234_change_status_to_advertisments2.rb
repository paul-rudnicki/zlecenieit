class ChangeStatusToAdvertisments2 < ActiveRecord::Migration[5.0]
  def change
  	change_column :advertisments, :status, :boolean, default: false
  end
end
