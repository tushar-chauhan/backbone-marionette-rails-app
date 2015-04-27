class AddUserIdToTodos < ActiveRecord::Migration
  def up
    add_column :todos, :user_id, :integer, null: false, default: 0
  end

  def down
    remove_column :todos, :user_id
  end
end
