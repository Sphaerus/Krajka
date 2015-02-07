class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :street
      t.string :postal_code
      t.string :province
      t.string :town
      t.string :country
      t.string :other
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :addresses, :users
  end
end
