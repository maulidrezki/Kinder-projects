class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :location
      t.text :description
      t.string :contact
      t.string :status
      t.string :instagram_link
      t.string :facebook_link
      t.string :website_link
      t.string :linkedin_link

      t.timestamps
    end
  end
end
