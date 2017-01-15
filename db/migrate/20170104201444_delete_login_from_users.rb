class DeleteLoginFromUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :login, :string, default: ''
  end
end
