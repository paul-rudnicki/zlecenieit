class ChangeDefaultVerifyToUsers < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :verify, :boolean, defualt: true
  end
end
