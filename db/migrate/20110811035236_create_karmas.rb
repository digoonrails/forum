class CreateKarmas < ActiveRecord::Migration
  def change
    create_table :karmas do |t|
      t.integer :value, :default => 0
      t.references :user
      t.references :post
      
      t.timestamps
    end
    
    add_index :karmas, :user_id
    add_index :karmas, :post_id    
    
  end
end
