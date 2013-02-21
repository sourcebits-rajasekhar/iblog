class RemoveNameAndEmailFromComments < ActiveRecord::Migration
  def up
  	remove_column :comments,:name
  	remove_column :comments,:email
  end

  def down
  	add_column :comments,:name,:string
  	add_column :comments,:email,:string
  end
end
