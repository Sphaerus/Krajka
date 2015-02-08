class AddNameToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :designation, :string
  end
end
