class RemoveDiplayNameFromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :display_name, :string
  end
end
