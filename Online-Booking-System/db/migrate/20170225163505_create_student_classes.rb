class CreateStudentClasses < ActiveRecord::Migration
  def change
    create_table :student_classes do |t|
      t.string :StudentClass

      t.timestamps null: false
    end
  end
end
