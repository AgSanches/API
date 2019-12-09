class CreateSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :sizes do |t|
      t.integer :number
      t.integer :quantity
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end
  end
end
