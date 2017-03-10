class CreateLockedOuts < ActiveRecord::Migration
  def change
    create_table :locked_outs do |t|
      t.string :user_id
      t.datetime :time_of

      t.timestamps null: false
    end
  end
end
