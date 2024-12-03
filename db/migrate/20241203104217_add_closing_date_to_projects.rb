class AddClosingDateToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :closing_date, :date
  end
end
