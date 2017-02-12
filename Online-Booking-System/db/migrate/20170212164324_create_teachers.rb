class CreateTeachers < ActiveRecord::Migration
  def change
	
    create_table :teachers do |t|
      
	  t.text :bio
      t.string :subjects,array:true
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :email
      t.boolean :authenticated, default:false

      t.timestamps null: false
    end
  end
end
