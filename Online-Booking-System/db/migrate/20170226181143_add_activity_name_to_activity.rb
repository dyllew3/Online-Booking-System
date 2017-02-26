class AddActivityNameToActivity < ActiveRecord::Migration
  def change
  	add_column :activities, :ActivityName, :string
  end
end
