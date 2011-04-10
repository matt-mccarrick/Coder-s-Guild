class AddUserForeignKeys < ActiveRecord::Migration
	def self.up
		add_column :exercises, :user_id, :integer
		add_column :tutorials, :user_id, :integer
	end
  
	def self.down
		remove_column :exercises, :user_id
		remove_column :tutorials, :user_id
	end
end
