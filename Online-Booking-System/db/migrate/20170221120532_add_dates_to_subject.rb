class AddDatesToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :days, :string,array:true
    add_column :subjects, :times, :string, array: true
  end
end
