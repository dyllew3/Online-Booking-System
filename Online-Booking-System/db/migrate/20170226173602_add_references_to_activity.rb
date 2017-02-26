class AddReferencesToActivity < ActiveRecord::Migration
  def change
  	add_foreign_key :activities, :StudentClass, column: :StartClassSuitability
  	add_foreign_key :activities, :StudentClass, column: :EndClassSuitability
  	add_foreign_key :activities, :Teacher, column: :ResponsibleTeacher
  end
end
