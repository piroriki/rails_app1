class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |task|
      task.text :title
      task.date :finished_day
      task.boolean :is_all_day
      task.text :memo

      task.timestamps
    end
  end
end
