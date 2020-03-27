class ModifyTodosTable < ActiveRecord::Migration
  def change
    remove_column :todos, :person_name
    add_column :todos, :user_id, :integer
  end
end
