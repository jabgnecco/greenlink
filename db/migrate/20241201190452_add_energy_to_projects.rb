class AddEnergyToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :energy, :string
  end
end
