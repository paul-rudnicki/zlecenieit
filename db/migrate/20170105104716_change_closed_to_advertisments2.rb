class ChangeClosedToAdvertisments2 < ActiveRecord::Migration[5.0]
  def change
  		change_column :advertisments, :closed, :boolean, default: false
  end
end
