class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :login
      t.string :name
      t.string :email
      t.string :password
      t.string :surnames
      t.string :street
      t.string :postalcode
      t.string :country
      t.string :city
      t.string :passport
      t.string :phone
      t.integer :type_user, default: 2

      t.timestamps
    end
  end
end
