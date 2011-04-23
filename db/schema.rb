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

ActiveRecord::Schema.define(:version => 20110423150809) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "slug"
    t.boolean  "draft_flag",   :default => false
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["published_at"], :name => "index_articles_on_published_at"
  add_index "articles", ["slug"], :name => "index_articles_on_slug"
  add_index "articles", ["title"], :name => "index_articles_on_title"

end
