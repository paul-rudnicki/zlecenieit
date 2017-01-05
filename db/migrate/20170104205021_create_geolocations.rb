class CreateGeolocations < ActiveRecord::Migration[5.0]
  def change
    create_table :geolocations do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :geolocations, :slug
  end
end
