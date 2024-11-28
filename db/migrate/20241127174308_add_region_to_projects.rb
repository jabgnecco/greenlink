class AddRegionToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :region, :string
  end
end
