class AddBoardToTaskList < ActiveRecord::Migration[5.1]
  def change
    add_column :task_lists, :board_id, :integer
    add_index :task_lists, :board_id
  end
end
