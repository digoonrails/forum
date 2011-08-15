# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110811040955) do

  create_table "blogs", :force => true do |t|
    t.boolean  "restricted"
    t.string   "url"
    t.string   "rss"
    t.string   "author"
    t.string   "avatar"
    t.string   "comment_expression"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "configurations", :force => true do |t|
    t.string "name"
    t.string "value"
  end

  create_table "forums", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "position",     :default => 0
    t.integer  "topics_count", :default => 0
    t.integer  "posts_count",  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "karmas", :force => true do |t|
    t.integer  "value",      :default => 0
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "karmas", ["post_id"], :name => "index_karmas_on_post_id"
  add_index "karmas", ["user_id"], :name => "index_karmas_on_user_id"

  create_table "moderatorships", :force => true do |t|
    t.integer "user_id"
    t.integer "forum_id"
  end

  add_index "moderatorships", ["forum_id"], :name => "index_moderatorships_on_forum_id"
  add_index "moderatorships", ["user_id"], :name => "index_moderatorships_on_user_id"

  create_table "phrases", :force => true do |t|
    t.string  "text"
    t.integer "user_id"
  end

  add_index "phrases", ["user_id"], :name => "index_phrases_on_user_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "good_karma_count", :default => 0
    t.integer  "bad_karma_count",  :default => 0
    t.integer  "topic_id"
    t.integer  "user_id"
    t.integer  "forum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["forum_id"], :name => "index_posts_on_forum_id"
  add_index "posts", ["topic_id"], :name => "index_posts_on_topic_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id"
    t.text     "data"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["user_id"], :name => "index_sessions_on_user_id"

  create_table "topics", :force => true do |t|
    t.boolean  "sticky",      :default => false
    t.integer  "hits",        :default => 0
    t.integer  "posts_count", :default => 0
    t.string   "title"
    t.datetime "replied_at"
    t.integer  "forum_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topics", ["forum_id"], :name => "index_topics_on_forum_id"
  add_index "topics", ["user_id"], :name => "index_topics_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "display_name"
    t.string   "email"
    t.string   "password"
    t.boolean  "admin"
    t.integer  "posts_count"
    t.datetime "last_seen_at"
    t.string   "login_key"
    t.datetime "login_key_expires_at"
    t.string   "aim"
    t.string   "yahoo"
    t.string   "google_talk"
    t.string   "msn"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
