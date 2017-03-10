class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.text :bio
      t.string :subjectsi,array:true,:default => []

      t.timestamps null: false
    end
  end
end
