class AddAuthenticationToTeachers < ActiveRecord::Migration
  def change
		   
		
	add_column :teachers, :activation_digest, :string
    add_column :teachers, :activated, :boolean, default: false
    add_column :teachers, :activated_at, :datetime


  end
end
