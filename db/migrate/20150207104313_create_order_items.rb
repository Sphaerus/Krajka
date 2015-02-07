class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :cart, index: true
      t.references :order, index: true
      t.references :magazine, index: true
      t.integer :amount

      t.timestamps null: false
    end
    add_foreign_key :order_items, :carts
    add_foreign_key :order_items, :orders
    add_foreign_key :order_items, :magazines
  end
end
