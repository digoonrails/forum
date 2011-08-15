class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.boolean :restricted
      t.string :url
      t.string :rss
      t.string :author
      t.string :avatar
      t.string :comment_expression
      
      t.timestamps
    end
  end
end