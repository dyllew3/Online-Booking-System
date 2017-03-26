class RecreateActivitiesTable < ActiveRecord::Migration
  def change
  	create_table "activities", force: :cascade do |t|
    t.integer  "ResponsibleTeacher"
    t.text     "Description"
    t.integer  "StartClassSuitability"
    t.integer  "EndClassSuitability"
    t.date     "StartDate"
    t.date     "EndDate"
    t.time     "StartTime"
    t.time     "EndTime"
    t.integer  "NoOfChildren"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "ActivityName"
  end
  end
end
