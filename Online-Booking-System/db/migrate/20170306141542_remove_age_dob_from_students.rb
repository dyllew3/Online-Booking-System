class RemoveAgeDobFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :age, :integer
    remove_column :students, :dob, :text
  end
end
