class CreateRelationships < ActiveRecord::Migration[8.0]
  def change
    create_table :relationships do |r|
      r.references :followed, foreign_key: { to_table: :users }
      r.references :follower, foreign_key: { to_table: :users }
    end
  end
end
