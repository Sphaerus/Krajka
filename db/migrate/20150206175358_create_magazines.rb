class CreateMagazines < ActiveRecord::Migration
  def change
    create_table :magazines do |t|
      t.datetime :date
      t.string :title
      t.text :description
      t.float :price

      t.timestamps null: false
    end
  end
end
