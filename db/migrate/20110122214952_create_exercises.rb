class CreateExercises < ActiveRecord::Migration
  def self.up
    create_table :exercises do |t|
      t.string :created_by
      t.string :section
      t.string :title
      t.text :article
      t.integer :upvotes
      t.integer :downvotes
      t.timestamps
    end
  end

  def self.down
    drop_table :exercises
  end
end
