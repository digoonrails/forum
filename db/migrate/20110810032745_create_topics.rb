class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.boolean :sticky, :default => false
      t.string :title
      t.integer :hits, :default => 0

      t.integer :posts_count, :default => 0
      t.datetime :replied_at

      t.references :forum
      t.references :user

      t.timestamps
    end
  end
end
