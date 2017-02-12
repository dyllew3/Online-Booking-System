class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :subject
      t.string :teacher
      t.string :students,array:true, :default =>[]
      t.integer :capacity
      t.integer :spaces

      t.timestamps null: false
    end
  end
end
