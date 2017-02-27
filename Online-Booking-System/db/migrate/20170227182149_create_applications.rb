class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.references :student, index: true, foreign_key: true
      t.references :activity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
