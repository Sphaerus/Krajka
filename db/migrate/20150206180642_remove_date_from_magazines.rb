class RemoveDateFromMagazines < ActiveRecord::Migration
  def change
    change_column :magazines, :date,  :date
  end
end
