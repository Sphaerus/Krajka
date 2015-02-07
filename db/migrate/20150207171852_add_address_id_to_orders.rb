class AddAddressIdToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :address, index: true
    add_foreign_key :orders, :addresses
  end
end
