class CreateSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :sizes do |t|
      t.integer :number
      t.integer :quantity

      t.timestamps
    end
  end
end
