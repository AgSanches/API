class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.text :street
      t.string :postalcode
      t.string :country
      t.string :city
      t.string :passport
      t.string :phone
      t.string :methodship
      t.string :methodpayment
      t.integer :quantity
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
