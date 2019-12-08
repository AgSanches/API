class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.decimal :discount
      t.boolean :isSale
      t.text :description
      t.references :brand, null: false, foreign_key: true
      t.date :create

      t.timestamps
    end
  end
end
