class AddReachedColumnInUserProject < ActiveRecord::Migration
  def change
     add_column :projects_users, :reached, :boolean
  end
end
