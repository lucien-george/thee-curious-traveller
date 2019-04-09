class CreateBreakdowns < ActiveRecord::Migration[5.2]
  def change
    create_table :breakdowns do |t|
      t.references :activity, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
