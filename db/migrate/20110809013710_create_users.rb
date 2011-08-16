class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :login
      t.string    :display_name
      t.string    :email
      t.string    :password
      t.boolean   :admin
      t.integer   :posts_count
      
      t.datetime  :last_seen_at
      t.datetime  :last_login_at
      t.string    :login_key
      t.datetime  :login_key_expires_at
      
      # to facilite better communication
      t.string    :aim
      t.string    :yahoo
      t.string    :google_talk
      t.string    :msn
      t.string    :website

      t.timestamps
    end
  end
end
