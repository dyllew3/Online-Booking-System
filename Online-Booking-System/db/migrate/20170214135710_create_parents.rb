class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :phone_num

      t.timestamps null: false
    end
  end
end
