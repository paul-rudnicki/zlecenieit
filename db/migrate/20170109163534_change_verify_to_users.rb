class ChangeVerifyToUsers < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :verfiy, :verify
  end
end
