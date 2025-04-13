ActiveRecord::Schema[8.0].define(version: 2025_04_13_052340) do
  create_table "posts", force: :cascade do |t|
    t.string "content", limit: 140
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
