class CreateRelationships < ActiveRecord::Migration[8.0]
  def change
    create_table :relationships do |r|
      # ユニークインデックスと重複しているので、index: falseにする
      r.references :followed, foreign_key: { to_table: :users }, index: false
      r.references :follower, foreign_key: { to_table: :users }
    end

    # ユニークインデックスを追加
    add_index :relationships, [:followed_id, :follower_id], unique: true
  end
end
