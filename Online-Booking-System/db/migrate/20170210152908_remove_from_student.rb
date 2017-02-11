class RemoveFromStudent < ActiveRecord::Migration
  def change
		
		remove_column :students, :class	
		
  end
end
