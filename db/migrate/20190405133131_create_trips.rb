class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :sku
      t.string :title
      t.text :description
      t.string :destination
      t.string :price

      t.timestamps
    end
  end
end
