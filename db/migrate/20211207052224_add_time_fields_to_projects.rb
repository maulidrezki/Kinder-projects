class AddTimeFieldsToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :start_date, :date
    add_column :projects, :end_date, :date
    add_column :projects, :start_time, :datetime
    add_column :projects, :end_time, :datetime
  end
end
