class AddCapacityToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :capacity, :integer
  end
end
