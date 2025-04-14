class AddUserref < ActiveRecord::Migration[8.0]
  def change
    change_table :posts do |t|
      add_reference(:posts,:user)
    end
  end
end
