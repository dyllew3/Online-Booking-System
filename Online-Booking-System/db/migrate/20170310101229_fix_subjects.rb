class FixSubjects < ActiveRecord::Migration
  def change
	   rename_column :teachers, :subjectsi, :subjects

  end
end
