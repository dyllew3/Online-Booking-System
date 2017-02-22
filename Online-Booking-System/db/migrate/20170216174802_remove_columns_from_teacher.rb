class RemoveColumnsFromTeacher < ActiveRecord::Migration
  	def change
  		 remove_column :teachers, :first_name, :string
		remove_column :teachers, :last_name, :string
		remove_column :teachers, :email, :string
	
		
	end
end
