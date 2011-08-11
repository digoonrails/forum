class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :good_karma_count, :default => 0
      t.integer :bad_karma_count, :default => 0
      
      t.references :topic
      t.references :user
      t.references :forum
      
      t.timestamps
    end
    
    add_index :posts, :topic_id
    add_index :posts, :user_id
    add_index :posts, :forum_id    
    
  end
end
