class CreateLockouts < ActiveRecord::Migration
  def change
    create_table :lockouts do |t|

      t.timestamps null: false
    end
  end
end
