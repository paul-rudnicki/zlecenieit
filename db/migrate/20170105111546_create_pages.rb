class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.boolean :visibility, default: false

      t.timestamps
    end
  end
end
