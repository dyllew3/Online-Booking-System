class RemoveSubjectsFromTeacher < ActiveRecord::Migration
  def change
  	remove_column :teachers, :subjects
  end
end
