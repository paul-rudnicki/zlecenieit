class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.text :content
      t.string :price
      t.string :realization
      t.references :advertisment, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
