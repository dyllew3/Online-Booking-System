class AddIdToStudent < ActiveRecord::Migration
  def change
    add_reference :students, :parent_id, index: true, foreign_key: true
  end
end
