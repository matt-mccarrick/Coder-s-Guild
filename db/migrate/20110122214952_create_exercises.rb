class CreateExercises < ActiveRecord::Migration
  def self.up
    create_table :exercises do |t|
      t.integer :created_by
      t.string :section
      t.string :title
      t.text :article
      t.integer :upvotes, :default => 0
      t.integer :downvotes, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :exercises
  end
end
