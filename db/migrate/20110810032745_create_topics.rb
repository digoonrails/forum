class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.boolean :sticky, :default => false
      t.integer :hits, :default => 0
      t.integer :posts_count, :default => 0
      t.string :title
      t.datetime :replied_at

      t.references :forum
      t.references :user

      t.timestamps
    end
    
    add_index :topics, :forum_id
    add_index :topics, :user_id
    
  end
end
