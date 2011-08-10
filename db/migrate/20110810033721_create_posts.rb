class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.boolean :sticky, :default => false
      t.integer :hits, :default => 0
      t.integer :posts_count, :default => 0
      t.datetime :replied_at

      t.references :topic
      t.references :user
      t.references :forum
      
      t.timestamps
    end
  end
end
