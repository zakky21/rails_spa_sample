class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :name, null: false, default: ''
      t.integer :status, null: false, default: 0
      t.timestamps
    end

    create_table :labels do |t|
      t.string :name, null: false, default: ''
      t.timestamps
    end

    create_table :todo_labels do |t|
      t.references :todo
      t.references :label
      t.timestamps
    end
  end
end
