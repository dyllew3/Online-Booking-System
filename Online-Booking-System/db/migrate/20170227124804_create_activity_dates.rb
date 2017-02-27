class CreateActivityDates < ActiveRecord::Migration
  def change
    create_table :activity_dates do |t|
      t.references :activity, index: true, foreign_key: true
      t.date :date

      t.timestamps null: false
    end
  end
end
