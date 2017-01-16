class AddPhoneToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phone, :string
    add_column :users, :skype, :string
    add_column :users, :city, :string
    add_column :users, :province, :string
  end
end
