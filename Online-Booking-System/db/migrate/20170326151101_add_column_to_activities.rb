class AddColumnToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :image_link, :string
  end
end
