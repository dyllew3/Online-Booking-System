class AddColumnToLockout < ActiveRecord::Migration
  def change
    add_column :lockouts, :count, :integer,:default => 0

  end
end
