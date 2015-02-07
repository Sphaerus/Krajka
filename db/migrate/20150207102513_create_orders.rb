class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :cart, index: true
      t.string :name

      t.timestamps null: false
    end
    add_foreign_key :orders, :carts
  end
end
