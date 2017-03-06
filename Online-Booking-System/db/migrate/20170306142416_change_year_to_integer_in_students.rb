class ChangeYearToIntegerInStudents < ActiveRecord::Migration
  def change
  	change_column :students, :year, :integer
  end
end
