class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.boolean :admin,:default => false
		
      t.references :userable,polymorphic:true,index:true
      t.timestamps null: false
    end
  	 add_index :users, :last_name
  end
end
