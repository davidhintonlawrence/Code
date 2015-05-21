class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.boolean :status
      t.date :create_date
      t.date :start_date
      t.boolean :complete
      t.integer :category_id
      t.date :due_on
      t.integer :user_id
      t.text :description

      t.timestamps

    end
  end
end
