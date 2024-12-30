# db/migrate/XXXXXX_create_posts.rb
class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.datetime :scheduled_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
