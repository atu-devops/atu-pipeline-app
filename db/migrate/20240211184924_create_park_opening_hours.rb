class CreateParkOpeningHours < ActiveRecord::Migration[7.0]
  def change
    create_table :park_opening_hours do |t|
      t.references :park, null: false, foreign_key: true
      t.integer :start_month
      t.integer :end_month
      t.integer :day_of_week
      t.time :opening_time
      t.time :closing_time

      t.timestamps
    end
  end
end
