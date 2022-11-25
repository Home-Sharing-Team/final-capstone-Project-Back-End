class CreateBlockedPeriodsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :blocked_periods do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false
      
      t.references :property, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
