class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :subject
      t.string :teacher
      t.string :times, array:true
      t.integer :capacity
      t.integer :spots_left

      t.timestamps null: false
    end
  end
end
