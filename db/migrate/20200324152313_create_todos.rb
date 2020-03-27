class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :person_name
      t.text :content
      t.boolean :completed, default: false
    end
  end
end
