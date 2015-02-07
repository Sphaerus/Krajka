class AddCoverToMagazines < ActiveRecord::Migration
  def change
    add_column :magazines, :cover, :string
  end
end
