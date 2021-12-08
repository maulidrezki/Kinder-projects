class AddDisplayNameToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :display_name, :string
  end
end
