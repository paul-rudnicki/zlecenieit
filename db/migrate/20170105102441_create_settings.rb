class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.string :site_name
      t.boolean :maintenance, default: false

      t.timestamps
    end
  end
end
