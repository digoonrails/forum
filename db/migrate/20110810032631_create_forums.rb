class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :name
      t.string :description
      t.integer :position, :default => 0
      t.integer :topics_count, :default => 0
      t.integer :posts_count, :default => 0
      
      t.timestamps
    end
  end
end
