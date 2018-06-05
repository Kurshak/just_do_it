class RemoveComplitedFromTasks < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :complited, :boolean
  end
end
