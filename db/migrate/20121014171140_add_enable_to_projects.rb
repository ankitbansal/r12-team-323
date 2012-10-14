class AddEnableToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :enable_todo, :boolean
    add_column :projects, :enable_comments, :boolean
    add_column :projects, :instagram_tag, :string
  end
end
