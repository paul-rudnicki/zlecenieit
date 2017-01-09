class AddVerifyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :verfiy, :boolean, defualt: false
  end
end
