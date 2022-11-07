class CreateBlockedPeriodsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :blocked_periods do |t|
      t.references :property, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
