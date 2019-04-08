class AddTripToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_reference :photos, :trip, foreign_key: true
  end
end
