class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :subject
      t.integer :capacity
      t.integer :spots_left
      t.string :teacher
      t.references :teacher, index: true, foreign_key: true
      t.boolean :full, :default => false

      t.timestamps null: false
    end
  end
end
