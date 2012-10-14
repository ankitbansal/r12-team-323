class AddDateToProject < ActiveRecord::Migration
  def change
    add_column :projects, :project_date, :date
  end
end
