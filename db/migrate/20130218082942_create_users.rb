class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username , :limit => 35 ,:null =>false
      t.string :email , :limit => 130 ,:null =>false
      t.boolean :admin, :null => false, :default => false 
      t.timestamps
    end
  end
end
