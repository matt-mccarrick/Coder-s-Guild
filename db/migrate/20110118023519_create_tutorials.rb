class CreateTutorials < ActiveRecord::Migration
  def self.up
    create_table :tutorials do |t|
      t.integer :created_by
      t.string :title
      t.text :article
      t.integer :upvotes
      t.integer :downvotes
      t.timestamps
    end
  end

  def self.down
    drop_table :tutorials
  end
end
