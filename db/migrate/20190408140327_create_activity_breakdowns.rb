class CreateActivityBreakdowns < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_breakdowns do |t|
      t.references :activity, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
