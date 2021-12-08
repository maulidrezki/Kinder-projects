class ChangeStartTimeToProjects < ActiveRecord::Migration[6.1]
  def change
    change_column :projects, :start_time, :time
    change_column :projects, :end_time, :time
  end
end
