class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :session_id
      t.text :data
      
      t.references :user
      
      t.timestamps
    end
    
    add_index :sessions, :user_id
    
  end
end
