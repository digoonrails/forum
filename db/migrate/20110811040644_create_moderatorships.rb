class CreateModeratorships < ActiveRecord::Migration
  def change
    create_table :moderatorships do |t|
      t.references :user
      t.references :forum
    end
    
    add_index :moderatorships, :user_id
    add_index :moderatorships, :forum_id
    
  end
end
