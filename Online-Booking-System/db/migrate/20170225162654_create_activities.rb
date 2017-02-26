class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :ResponsibleTeacher
      t.text :Description
      t.integer :StartClassSuitability
      t.integer :EndClassSuitability
      t.date :StartDate
      t.date :EndDate
      t.time :StartTime
      t.time :EndTime
      t.integer :NoOfChildren

      t.timestamps null: false
    end
  end
end
