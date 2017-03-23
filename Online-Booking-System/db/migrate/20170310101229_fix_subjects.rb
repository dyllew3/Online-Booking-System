class FixSubjects < ActiveRecord::Migration
  def change
	   rename_column :teachers, :subjects, :subjects

  end
end
