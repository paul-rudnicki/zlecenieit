class ChangeClosedToAdvertisments < ActiveRecord::Migration[5.0]
  def change
  	change_column :advertisments, :closed, :boolean, defualt: false
  end
end
