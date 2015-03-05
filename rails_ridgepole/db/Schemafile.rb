create_table :sessions do |t|
  t.integer :user_id, null: false
  t.string :cookie, null: false
  t.string :api_token, null: false
end

add_index :sessions, :user_id, unique: true
