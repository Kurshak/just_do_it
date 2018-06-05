class AddDetalistoTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :time_complited, :datetime
    add_column :tasks, :integer, :string
  end
end
