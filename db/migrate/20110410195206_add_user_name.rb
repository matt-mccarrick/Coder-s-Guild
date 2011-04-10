class AddUserName < ActiveRecord::Migration
  def self.up
		add_column :users, :userName, :string
	end
  
	def self.down
		remove_column :users, :userName
	end
end
