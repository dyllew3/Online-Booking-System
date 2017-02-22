class AddAuthenticatedToUser < ActiveRecord::Migration
  def change
    add_column :users, :authenicated, :boolean,:default => false
  end
end
