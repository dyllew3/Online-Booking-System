class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :year
      t.string :dob
      t.references :parent, index: true, foreign_key: true
     

      t.timestamps null: false
    end
  end
end