class AddReferenceToStudent < ActiveRecord::Migration
  def change
    add_column :students, :references, :subject
  end
end
