class ChangeVerifyForUsers < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :users, :verify, true
  end
end
