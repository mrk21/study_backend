class InitSchema < ActiveRecord::Migration
  def up
    
    # These are extensions that must be enabled in order to support this database
    enable_extension "plpgsql"
    
    create_table "entries", force: :cascade do |t|
      t.string   "title"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    
    create_table "tags", force: :cascade do |t|
      t.string   "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    
    create_table "users", force: :cascade do |t|
      t.string   "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    
  end

  def down
    raise "Can not revert initial migration"
  end
end
