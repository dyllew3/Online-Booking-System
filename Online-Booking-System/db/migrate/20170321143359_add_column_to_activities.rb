class AddColumnToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :string, :imageLink
  end
end
