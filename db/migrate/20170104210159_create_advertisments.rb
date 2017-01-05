class CreateAdvertisments < ActiveRecord::Migration[5.0]
  def change
    create_table :advertisments do |t|
      t.string :title
      t.text :content
      t.string :price
      t.boolean :status
      t.boolean :closed
      t.integer :winner
      t.string :realization
      t.datetime :ended_date
      t.string :slug
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.references :geolocation, foreign_key: true

      t.timestamps
    end
  end
end
