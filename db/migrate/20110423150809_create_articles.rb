class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.boolean :draft_flag, :default => false
      t.datetime :published_at
      t.timestamps
    end
    add_index :articles, :title
    add_index :articles, :slug
    add_index :articles, :published_at
  end

  def self.down
    drop_table :articles
  end
end
