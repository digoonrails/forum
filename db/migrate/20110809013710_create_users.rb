class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :email
      t.string :password
      t.boolean :admin
      t.integer :posts_count

      t.timestamps
    end
  end
end
