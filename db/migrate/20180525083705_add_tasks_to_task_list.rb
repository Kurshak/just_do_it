class AddTask_listToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :task_list_id, :integer
    add_index :tasks :task_list_id
  end
end
