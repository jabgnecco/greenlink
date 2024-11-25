class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :address
      t.string :auditor
      t.float :progress
      t.float :latitude
      t.float :longitude
      t.integer :target

      t.timestamps
    end
  end
end
