class AddColumnsToLockout < ActiveRecord::Migration
  def change
    add_column :lockouts, :user_id, :integer
  end
end
