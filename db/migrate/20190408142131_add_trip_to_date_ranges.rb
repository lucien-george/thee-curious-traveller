class AddTripToDateRanges < ActiveRecord::Migration[5.2]
  def change
    add_reference :date_ranges, :trip, foreign_key: true
  end
end
