class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.text :title
      t.date :finished_day
      t.boolean :is_all_day
      t.text :memo

      t.timestamps
    end
  end
end
