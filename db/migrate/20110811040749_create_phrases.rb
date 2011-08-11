class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.string :text
      t.references :user
    end
    
    add_index :phrases, :user_id
    
  end
end
